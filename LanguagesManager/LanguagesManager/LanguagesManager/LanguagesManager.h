//
//  LanguagesManager.h
//  LanguagesManager
//
//  Created by Jerome Morissard on 12/10/13.
//  Copyright (c) 2013 Jerome Morissard. All rights reserved.
//

#import <Foundation/Foundation.h>

#define JMOLocalizedString(key, comment) \
[[LanguagesManager sharedInstance] localizedStringForKey:(key) value:(comment)]

#define JMOLocalizationSetLanguage(language) \
[[LanguagesManager sharedInstance] setLanguage:(language)]

// Log using the same parameters above but include the function name and source code line number in the log statement
#ifdef DEBUG
#define JMOLog(fmt, ...) NSLog((@"Func: %s, Line: %d, " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define JMOLog(...)
#endif

@interface LanguagesManager : NSObject

+ (LanguagesManager *)sharedInstance;

//gets the string localized
- (NSString *)localizedStringForKey:(NSString *)key value:(NSString *)comment;

//getter/setter the language
- (void)setLanguage:(NSString*) language;
- (NSString*) getLanguage;

//resets this system.
- (void)resetLocalization;

@end
