//
//  LanguagesManager.h
//  LanguagesManager
//
//  Created by Jerome Morissard on 12/10/13.
//  Copyright (c) 2014 Jerome Morissard. All rights reserved.
//
//  Apple Docs : https://developer.apple.com/library/mac/documentation/macosx/conceptual/bpinternational/Articles/LanguageDesignations.html
//  Languages formats : ISO 639-1 and ISO 639-2

#import <Foundation/Foundation.h>

extern NSString * const LanguagesManagerLanguageDidChangeNotification;

#define JMOLocalizedString(key, comment) \
[[LanguagesManager sharedInstance] localizedStringForKey:(key) value:(comment)]

@interface LanguagesManager : NSObject

@property (assign, nonatomic, getter=notificationIsEnable) BOOL notificationEnable;

// Singleton
+ (LanguagesManager *)sharedInstance;

/**
 *  Gets the string localized in the current language
 *
 *  @param key     NSString, Key
 *  @param comment NSString, comment
 *
 *  @return NSString, localized value
 */
- (NSString *)localizedStringForKey:(NSString *)key value:(NSString *)comment;

/**
 *   Gets the localized image
 *
 *  @param imageName NSString, imageNamed
 *  @param type      NSString, comment
 *
 *  @return UIImage, localized image
 */
- (UIImage *)localizedImageName:(NSString *)imageName type:(NSString *)type;

// Langue support ISO 639-1 and ISO 639-2 format
/**
 *  Change the current language
 *
 *  @param language NSString, language
 *
 *  @return BOOL, YES if the currentLanguage change
 */
- (BOOL)setLanguage:(NSString*)language;

/**
 *  get Default Language
 *
 *  @return NSString, Default Language
 */
- (NSString*)getDefaultLanguage;

/**
 *  get Current Language
 *
 *  @return NSString, currentLanguage
 */
- (NSString *)currentLanguage;

/**
 *  get available Languages
 *
 *  @return NSArray, available Languages
 */
- (NSArray *)availableLanguages;

/**
 *  Multiple users support, Change the current language
 *
 *  @param language NSString, currentLanguage change
 *  @param login    NSString, login
 *
 *  @return BOOL, YES if the currentLanguage change
 */
- (BOOL)setLanguage:(NSString*)language forLogin:(NSString *)login;

/**
 *  get Current Language for a specific login
 *
 *  @param login  NSString, login
 *
 *  @return NSString, Default Language
 */
- (NSString*) getDefaultLanguageForLogin:(NSString *)login;

@end

// Log using the same parameters above but include the function name and source code line number in the log statement
#ifdef DEBUG
#define JMOLog(fmt, ...) NSLog((@"Func: %s, Line: %d, " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define JMOLog(...)
#endif