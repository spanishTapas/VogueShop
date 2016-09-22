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
#import "VSPromptAuthenticationController.h"
#define LOGIN_BUTTON_TITLE @"Login"
#define POPOVER_CONTENT_WIDTH self.view.bounds.size.width * 0.67
#define POPOVER_CONTENT_HEIGHT self.view.bounds.size.height * 0.40

@interface VSLoginViewController ()
@property (weak, nonatomic) IBOutlet UIImageView * backgroundImage;
@property (weak, nonatomic) IBOutlet UIImageView * vogueStoreImage;
@property (weak, nonatomic) IBOutlet UIButton * loginButton;

@property(nonatomic,retain) UIPopoverPresentationController * promptPopover;

@end

@implementation VSLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Setup UI of login screen
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

- (IBAction)promptToAuthentication:(id)sender {
    //Customized popover to prompt user for touchID authentication
    VSPromptAuthenticationController * promptVC = [[VSPromptAuthenticationController alloc] init];
    UINavigationController * destNav = [[UINavigationController alloc] initWithRootViewController:promptVC];
    
    // Configure the popoverPresentationController
    promptVC.preferredContentSize = CGSizeMake(POPOVER_CONTENT_WIDTH,POPOVER_CONTENT_HEIGHT);
    destNav.modalPresentationStyle = UIModalPresentationPopover;
    _promptPopover = destNav.popoverPresentationController;
    _promptPopover.permittedArrowDirections = 0; // Remove popover arrow
    _promptPopover.delegate = self;
    _promptPopover.sourceView = self.view;
    _promptPopover.sourceRect = self.loginButton.frame;
    destNav.navigationBarHidden = YES;
    
    [self presentViewController:destNav animated:YES completion:^{
        [self performTouchIDAuthentication];
    }];
    
    
}

# pragma mark - UIPopoverPresentationControllerDelegate
- (UIModalPresentationStyle) adaptivePresentationStyleForPresentationController: (UIPresentationController * ) controller {
    return UIModalPresentationNone;
}

# pragma mark - TouchID Authentication
- (void)performTouchIDAuthentication {
    
    LAContext * context = [[LAContext alloc] init];
    
    NSError *error = nil;
    
    if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error]) {
        [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics
                localizedReason:@"Authentication is needed to access your account."
                          reply:^(BOOL success, NSError *error) {
                              
          if (error) {
              NSLog(@"There was a problem verifying your identity.");
//              UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"Error"
//                                                                              message:@"There was a problem verifying your identity."
//                                                                       preferredStyle:UIAlertControllerStyleAlert];
//              
//              UIAlertAction * alertAction = [UIAlertAction actionWithTitle:@"OK"
//                                                                     style:UIAlertActionStyleDefault
//                                                                   handler:^(UIAlertAction * action) {
//                                                                       [self dismissViewControllerAnimated:YES completion:NULL];
//                                                                   }];
//              [alert addAction:alertAction];
//              [self presentViewController:alert animated:YES completion:NULL];
              return;
          }
          
          if (success) {
              NSLog(@"Authentication succeeded");
              [self dismissViewControllerAnimated:YES completion:NULL];

              
              
          }
          else {
              NSLog(@"Authentication failed. Please try again.");
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
        NSLog(@"Your device cannot authenticate using TouchID.");
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


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
