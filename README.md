LanguagesManager
================

An easy way to control manually the language in your application

### Very simple usage, just configure your supported languages
```objective-c
[[LanguagesManager sharedInstance] setSupportedLanguages:@[@"en", @"fr"]];
```

###  Change the language

```objective-c
[[LanguagesManager sharedInstance] setLanguage:@"en"]
```

###  Refreshing your localized elements (look at the sample) 

#### Slightly
Listen to the LanguagesManager notification
```objective-c
[[LanguagesManager sharedInstance] setNotificationEnable:YES];

[[NSNotificationCenter defaultCenter] addObserver:self                                                                                                          selector:@selector(reloadMyUI:)
                                      name:LanguagesManagerLanguageDidChangeNotification
                                      object:nil];
                                      

```

#### Hardly .... 
Reset your window.rootViewController 





