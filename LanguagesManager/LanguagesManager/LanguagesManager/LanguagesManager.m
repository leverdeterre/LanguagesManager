//
//  LanguagesManager.m
//  LanguagesManager
//
//  Created by Jerome Morissard on 12/10/13.
//  Copyright (c) 2013 Jerome Morissard. All rights reserved.
//

#import "LanguagesManager.h"

static LanguagesManager *sharedInstance = nil;

NSString * const LanguagesManagerLanguageDidChangeNotification = @"LanguagesManagerLanguageDidChangeNotification";

@interface LanguagesManager()
@property (strong, nonatomic) NSBundle *bundle;
@property (assign, nonatomic) NSString *currentLanguage;
@end

@implementation LanguagesManager

#pragma mark Instance Singleton

// Get the shared instance and create it if necessary.
+ (LanguagesManager *)sharedInstance
{
    if (nil != sharedInstance) {
        return sharedInstance;
    }
    
    static dispatch_once_t pred;        // Lock
    dispatch_once(&pred, ^{             // This code is called at most once per app
        sharedInstance = [[LanguagesManager alloc] init];
    });
    
    return sharedInstance;
}

// We can still have a regular init method, that will get called the first time the Singleton is used.
- (id)init
{
    self = [super init];
    if (self) {
        self.currentLanguage = [self getLanguage];
        NSString *path = [[ NSBundle mainBundle ] pathForResource:self.currentLanguage ofType:@"lproj" ];
        self.bundle = [NSBundle bundleWithPath:path];
    }
    return self;
}

+ (id)allocWithZone:(NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [super allocWithZone:zone];
    });
    
    return sharedInstance;
}


#pragma mark Langues Management

- (void)setBundle:(NSBundle *)bundle
{
    if (![_bundle isEqual:bundle]) {
        _bundle = bundle;
        [[NSNotificationCenter defaultCenter] postNotificationName:LanguagesManagerLanguageDidChangeNotification object:nil];
    }
}

// Gets the current localized string as in NSLocalizedString.
// JMOLocalizedString(@"Text to localize",@"Alternative text, in case hte other is not find");
- (NSString *)localizedStringForKey:(NSString *)key value:(NSString *)comment
{
	return [self.bundle localizedStringForKey:key value:comment table:nil];
}

// Sets the desired language of the ones you have.
// [self setLanguage:@"fr"];
- (void) setLanguage:(NSString *)language
{
	JMOLog(@"preferredLang: %@", language);
    if ([self isAnAvailableLanguage:language]) {
        NSString *path = [[ NSBundle mainBundle ] pathForResource:language ofType:@"lproj" ];
        self.bundle = [NSBundle bundleWithPath:path];
        
        [[NSUserDefaults standardUserDefaults] setObject:[NSArray arrayWithObjects:language, nil] forKey:@"AppleLanguages"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    else {
        JMOLog(@"%s unsupported language : %@", __FUNCTION__, language);
    }
}

- (BOOL)isAnAvailableLanguage:(NSString *)language
{
    NSString *path = [[ NSBundle mainBundle ] pathForResource:language ofType:@"lproj" ];
	if (path == nil) {
        return NO;
    }
    else {
        return YES;
    }
}

// Just gets the current setted up language.
- (NSString*) getLanguage
{
	NSArray* languages = [[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"];
	NSString *preferredLang = [languages objectAtIndex:0];
	return preferredLang;
}

// Resets the localization system, so it uses the OS default language.
- (void)setSupportedLanguages:(NSArray *)arrayOfLanguages
{
    [[NSUserDefaults standardUserDefaults] setObject:arrayOfLanguages forKey:@"AppleLanguages"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [self setLanguage:[arrayOfLanguages objectAtIndex:0]];
}


@end
