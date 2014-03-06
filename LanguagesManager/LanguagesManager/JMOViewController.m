//
//  JMOViewController.m
//  LanguagesManager
//
//  Created by Jerome Morissard on 12/10/13.
//  Copyright (c) 2013 Jerome Morissard. All rights reserved.
//

#import "JMOViewController.h"

@interface JMOViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UIButton *button2;

@end

@implementation JMOViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self refreshUI];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshUI) name:LanguagesManagerLanguageDidChangeNotification object:nil];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:LanguagesManagerLanguageDidChangeNotification object:nil];
}

- (void)refreshUI
{
    self.label.text = JMOLocalizedString(@"home.label.text", nil);
    [self.button setTitle:JMOLocalizedString(@"home.button.text", nil) forState:UIControlStateNormal];
    [self.button2 setTitle:JMOLocalizedString(@"home.button2.text", nil) forState:UIControlStateNormal];
    [self.imageView setImage:[[LanguagesManager sharedInstance] localizedImageName:@"image" type:@"png"]];
}

- (IBAction)switchPressed:(id)sender
{
    [AppDelegate() switchLanguageReloadingRootVc:YES];
}

- (IBAction)switchSlightlyPressed:(id)sender
{
    [AppDelegate() switchLanguageReloadingRootVc:NO];
}


@end
