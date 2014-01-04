LanguagesManager
================

An easy way to control manually the language in your application.
Multiple users can be managed to use different languages.

### Change the language

```objective-c
[[LanguagesManager sharedInstance] setLanguage:@"en"]
```

### Change for a particular login/user 

```objective-c
[[LanguagesManager sharedInstance] setLanguage:@"en" forLogin:@"jmo@github.com"]
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





