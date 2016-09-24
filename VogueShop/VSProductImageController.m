//
//  VSProductImageController.m
//  VogueShop
//
//  Created by wanming zhang on 9/22/16.
//  Copyright © 2016 Wanming Zhang. All rights reserved.
//

#import "VSProductImageController.h"

@interface VSProductImageController ()

@property (weak, nonatomic) IBOutlet UIImageView * productImageView;

@end

@implementation VSProductImageController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.productImageView.image = [UIImage imageNamed:self.imageID];
}



@end
