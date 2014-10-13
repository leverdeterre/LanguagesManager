LanguagesManager
================

[![Twitter](https://img.shields.io/badge/contact-@leverdeterre-green.svg)](http://twitter.com/leverdeterre)
[![License MIT](https://img.shields.io/badge/license-MIT-green.svg)](https://github.com/leverdeterre/LanguagesManager/blob/master/LICENCE)
[![Cocoapods](http://img.shields.io/cocoapods/v/LanguagesManager.svg)](https://github.com/leverdeterre/LanguagesManager)

An easy way to control manually the language in your application.
Multiple users can be managed to use different languages.

### Change the language of your app
```objective-c
//Change the localization bundle ! en.lproj will be use
[[LanguagesManager sharedInstance] setLanguage:@"en"];

//Change the localization bundle ! fr.lproj will be use
[[LanguagesManager sharedInstance] setLanguage:@"fr"];

//Change the language of your app for a particular login/user 
[[LanguagesManager sharedInstance] setLanguage:@"en" forLogin:@"jmo@github.com"]
```

### Localization Macro
```objective-c
JMOLocalizedString(@"key", @"your comment")
```

###  Refreshing your localized elements (look at the sample) 

#### Slightly
Listen to the LanguagesManager notification
```objective-c
[[LanguagesManager sharedInstance] setNotificationEnable:YES];

[[NSNotificationCenter defaultCenter] addObserver:self           
                                      selector:@selector(reloadMyLocalizableElements:)
                                      name:LanguagesManagerLanguageDidChangeNotification
                                      object:nil];
```

#### Hardly .... 
Reset your window.rootViewController 





