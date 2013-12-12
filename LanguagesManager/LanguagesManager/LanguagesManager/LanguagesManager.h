//
//  LanguagesManager.h
//  LanguagesManager
//
//  Created by Jerome Morissard on 12/10/13.
//  Copyright (c) 2013 Jerome Morissard. All rights reserved.
//
//  Apple Docs : https://developer.apple.com/library/mac/documentation/macosx/conceptual/bpinternational/Articles/LanguageDesignations.html
//  Languages formats : ISO 639-1 and ISO 639-2

#import <Foundation/Foundation.h>

extern NSString * const LanguagesManagerLanguageDidChangeNotification;

#define JMOLocalizedString(key, comment) \
[[LanguagesManager sharedInstance] localizedStringForKey:(key) value:(comment)]

#define JMOLocalizationSetLanguage(language) \
[[LanguagesManager sharedInstance] setLanguage:(language)]

@interface LanguagesManager : NSObject

+ (LanguagesManager *)sharedInstance;

- (void)setNotificationEnable:(BOOL)enable;

//gets the string localized
- (NSString *)localizedStringForKey:(NSString *)key value:(NSString *)comment;

// Langue support ISO 639-1 and ISO 639-2 format
- (void)setLanguage:(NSString*)language;
- (NSString*) getDefaultLanguage;

// Langues support ISO 639-1 and ISO 639-2 format
- (void)setSupportedLanguages:(NSArray *)arrayOfLanguages;

@end

// Log using the same parameters above but include the function name and source code line number in the log statement
#ifdef DEBUG
#define JMOLog(fmt, ...) NSLog((@"Func: %s, Line: %d, " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define JMOLog(...)
#endif