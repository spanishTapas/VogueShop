//
//  ViewController.m
//  VogueShop
//
//  Created by wanming zhang on 9/21/16.
//  Copyright © 2016 Wanming Zhang. All rights reserved.
//

#import "VogueShopLoginViewController.h"
#define LOGIN_BUTTON_TITLE @"Login"

@interface VogueShopLoginViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (weak, nonatomic) IBOutlet UIImageView *vogueStoreImage;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@end

@implementation VogueShopLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setupLoginPageAppearance];
}

- (void)setupLoginPageAppearance {
    self.backgroundImage.image = [UIImage imageNamed:@"Bubble_Background"];
    self.vogueStoreImage.image = [UIImage imageNamed:@"Vogue_Store"];
    
    [[self.loginButton layer] setBorderWidth:1.0f];
    [[self.loginButton layer] setCornerRadius:0.0];
    
    [self.loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.loginButton setBackgroundColor:[UIColor colorWithRed:89 / 255.0 green:116 / 255.0 blue:179 / 255.0 alpha:1.0]];
    [[self.loginButton layer] setBorderColor:[UIColor whiteColor].CGColor];

    [self.loginButton setTitle:LOGIN_BUTTON_TITLE forState:UIControlStateNormal];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
