LanguagesManager
================

[![Twitter](https://img.shields.io/badge/contact-@leverdeterre-green.svg)](http://twitter.com/leverdeterre)
[![License MIT](https://img.shields.io/badge/license-MIT-green.svg)](http://github.com/leverdeterre/LanguagesManager/LICENSE)
[![CocoaPods](http://img.shields.io/github/release/leverdeterre/LanguagesManager.svg)](https://github.com/LanguagesManager)

An easy way to control manually the language in your application.
Multiple users can be managed to use different languages.

### Change the language of your app

```objective-c
[[LanguagesManager sharedInstance] setLanguage:@"en"]
```

### Change the language of your app for a particular login/user 

```objective-c
[[LanguagesManager sharedInstance] setLanguage:@"en" forLogin:@"jmo@github.com"]
```



###  Refreshing your localized elements (look at the sample) 

#### Slightly
Listen to the LanguagesManager notification
```objective-c
[[LanguagesManager sharedInstance] setNotificationEnable:YES];

[[NSNotificationCenter defaultCenter] addObserver:self           
                                      selector:@selector(reloadMyUI:)
                                      name:LanguagesManagerLanguageDidChangeNotification
                                      object:nil];
                                      

```

#### Hardly .... 
Reset your window.rootViewController 





