//
//  JMOAppDelegate.h
//  LanguagesManager
//
//  Created by Jerome Morissard on 12/10/13.
//  Copyright (c) 2013 Jerome Morissard. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JMOAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

- (void)switchLanguageReloadingRootVc:(BOOL)reloadRootVc;

@end
