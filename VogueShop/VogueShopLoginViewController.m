//
//  ViewController.m
//  VogueShop
//
//  Created by wanming zhang on 9/21/16.
//  Copyright © 2016 Wanming Zhang. All rights reserved.
//

#import "VogueShopLoginViewController.h"


@interface VogueShopLoginViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (weak, nonatomic) IBOutlet UIImageView *vogueStoreImage;

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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
