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
@property (weak, nonatomic) IBOutlet UIImageView * eventImageView;

@end

@implementation VSProductImageController

- (void)viewDidLoad {
    [super viewDidLoad];
    // TODO: Remove hard coded logic later
    if (self.isProduct) {
        self.productImageView.image = [UIImage imageNamed:self.imageID];
    } else {
        self.eventImageView.image = [UIImage imageNamed:self.imageID];
    }
    
}



@end
