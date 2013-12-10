LanguagesManager
================

An easy way to force the language in your applications.

```

### Usage ... very simple, just configure your supported languages
```objective-c
[[LanguagesManager sharedInstance] setSupportedLanguages:@[@"en", @"fr"]];
```

###  Change the language

```objective-c
[[LanguagesManager sharedInstance] setLanguage:@"en"]
```

###  Refresh UI ?
#### hard .... but why not
Reset your window.rootViewController 

#### clean
Listen to the NSNotification
```objective-c
[[NSNotificationCenter defaultCenter] addObserver:self                                                                                                          selector:@selector(reloadMyUI:)
                                      name:LanguagesManagerLanguageDidChangeNotification
                                      object:nil];
```





