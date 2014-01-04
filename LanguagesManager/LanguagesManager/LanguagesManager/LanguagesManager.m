//
//  LanguagesManager.m
//  LanguagesManager
//
//  Created by Jerome Morissard on 12/10/13.
//  Copyright (c) 2013 Jerome Morissard. All rights reserved.
//

#import "LanguagesManager.h"

#define LanguagesManagerAppleLanguagesKey           @"AppleLanguages"
#define LanguagesManagerAppleLanguagesCustomKey     @"AppleLanguagesCustom"
#define LanguagesManagerDefaultUserKey              @"DefaultUser"

static LanguagesManager *sharedInstance = nil;

NSString * const LanguagesManagerLanguageDidChangeNotification = @"LanguagesManagerLanguageDidChangeNotification";

@interface LanguagesManager()
@property (strong, nonatomic) NSBundle *bundle;
@property (assign, nonatomic) BOOL notificationActivated;
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
        self.currentLanguage = [self getDefaultLanguage];
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
        if (self.notificationIsEnable) {
            [[NSNotificationCenter defaultCenter] postNotificationName:LanguagesManagerLanguageDidChangeNotification object:nil];            
        }
    }
}

// Gets the current localized string as in NSLocalizedString.
- (NSString *)localizedStringForKey:(NSString *)key value:(NSString *)comment
{
    if (nil == self.bundle) {
        NSString *defaultLanguage = [self getDefaultLanguage];
        [self setLanguage:defaultLanguage];
    }
	return [self.bundle localizedStringForKey:key value:comment table:nil];
}

// Sets the desired language
- (void)setLanguage:(NSString *)language
{
	JMOLog(@"preferredLang: %@", language);
    
    if ([self isAnAvailableLanguage:language]) {
        NSString *path = [[ NSBundle mainBundle ] pathForResource:language ofType:@"lproj" ];
        self.bundle = [NSBundle bundleWithPath:path];
        self.currentLanguage = language;

        NSMutableArray* customLanguagesOrder = [[[NSUserDefaults standardUserDefaults] objectForKey:LanguagesManagerAppleLanguagesCustomKey] mutableCopy];
        if (nil == customLanguagesOrder) {
            customLanguagesOrder = [[[NSUserDefaults standardUserDefaults] objectForKey:LanguagesManagerAppleLanguagesKey] mutableCopy];
        }
        
        [customLanguagesOrder removeObject:language];
        [customLanguagesOrder insertObject:language atIndex:0];
        [[NSUserDefaults standardUserDefaults] setObject:customLanguagesOrder forKey:LanguagesManagerAppleLanguagesCustomKey];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    else {
        JMOLog(@"%s unsupported language : %@", __FUNCTION__, language);
    }
}

// Just gets the current setted up language.
- (NSString*)getDefaultLanguage
{
    NSArray* customLanguagesOrder = [[NSUserDefaults standardUserDefaults] objectForKey:LanguagesManagerAppleLanguagesCustomKey];
    if (nil == customLanguagesOrder) {
        NSArray* languages = [[NSUserDefaults standardUserDefaults] objectForKey:LanguagesManagerAppleLanguagesKey];
        [[NSUserDefaults standardUserDefaults] setObject:languages forKey:LanguagesManagerAppleLanguagesCustomKey];
        [[NSUserDefaults standardUserDefaults] synchronize];
        return  [languages objectAtIndex:0];
    }
    
	return [customLanguagesOrder objectAtIndex:0];
}

#pragma mark Private

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

@end
