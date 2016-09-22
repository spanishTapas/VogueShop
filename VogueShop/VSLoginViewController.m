/**
//  ViewController.m
//  VogueShop
//
//  Created by wanming zhang on 9/21/16.
//  Copyright © 2016 Wanming Zhang. All rights reserved.

//  The login screen of Vogue Shop app
//  Press login button prompts touchID authentication
**/

#import "VSLoginViewController.h"
#import <LocalAuthentication/LocalAuthentication.h>

#define LOGIN_BUTTON_TITLE @"Login"

@interface VSLoginViewController ()
@property (weak, nonatomic) IBOutlet UIImageView * backgroundImage;
@property (weak, nonatomic) IBOutlet UIImageView * vogueStoreImage;
@property (weak, nonatomic) IBOutlet UIButton * loginButton;

@end

@implementation VSLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupLoginPageAppearance];
}

// Setup UI of login screen
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

- (IBAction)promptToAuthentication:(id)sender {
    


}

- (void)performTouchIDAuthentication {
    LAContext * context = [[LAContext alloc] init];
    
    NSError *error = nil;
    
    if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error]) {
        [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics
                localizedReason:@"Are you the device owner?"
                          reply:^(BOOL success, NSError *error) {
                              
                              if (error) {
                                  
                                  UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"Error"
                                                                                                  message:@"There was a problem verifying your identity."
                                                                                           preferredStyle:UIAlertControllerStyleAlert];
                                  
                                  UIAlertAction * alertAction = [UIAlertAction actionWithTitle:@"OK"
                                                                                         style:UIAlertActionStyleDefault
                                                                                       handler:^(UIAlertAction * action) {
                                                                                           [self dismissViewControllerAnimated:YES completion:NULL];
                                                                                       }];
                                  [alert addAction:alertAction];
                                  [self presentViewController:alert animated:YES completion:NULL];
                                  return;
                              }
                              
                              if (success) {
                                  
                                  UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"Success"
                                                                                                  message:@"Authentication succeeded."
                                                                                           preferredStyle:UIAlertControllerStyleAlert];
                                  
                                  UIAlertAction * alertAction = [UIAlertAction actionWithTitle:@"OK"
                                                                                         style:UIAlertActionStyleDefault
                                                                                       handler:^(UIAlertAction * action) {
                                                                                           [self dismissViewControllerAnimated:YES completion:NULL];
                                                                                       }];
                                  [alert addAction:alertAction];
                                  [self presentViewController:alert animated:YES completion:NULL];
                                  
                              } else {
                                  UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"Error"
                                                                                                  message:@"Authentication failed. Please try again."
                                                                                           preferredStyle:UIAlertControllerStyleAlert];
                                  
                                  UIAlertAction * alertAction = [UIAlertAction actionWithTitle:@"OK"
                                                                                         style:UIAlertActionStyleDefault
                                                                                       handler:^(UIAlertAction * action) {
                                                                                           [self dismissViewControllerAnimated:YES completion:NULL];
                                                                                       }];
                                  [alert addAction:alertAction];
                                  [self presentViewController:alert animated:YES completion:NULL];         }
                              
                          }];
        
    } else {
        
        UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"Error"
                                                                        message:@"Your device cannot authenticate using TouchID."
                                                                 preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction * alertAction = [UIAlertAction actionWithTitle:@"OK"
                                                               style:UIAlertActionStyleDefault
                                                             handler:^(UIAlertAction * action) {
                                                                 [self dismissViewControllerAnimated:YES completion:NULL];
                                                             }];
        [alert addAction:alertAction];
        [self presentViewController:alert animated:YES completion:NULL];
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
