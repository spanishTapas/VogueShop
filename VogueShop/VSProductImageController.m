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
@property (weak, nonatomic) IBOutlet UILabel * typeLabel;
// TODO: Use a place holder label now. Change to custom button later.
@property (weak, nonatomic) IBOutlet UILabel * actionButton;

@end

@implementation VSProductImageController

- (void)viewDidLoad {
    [super viewDidLoad];
    // TODO: Remove hard coded logic later
    switch (self.imageType) {
        case kVSImageTypeProduct:
            self.productImageView.image = [UIImage imageNamed:self.imageID];
            self.typeLabel.hidden = YES;
            self.actionButton.hidden = YES;
            break;
        case kVSImageTypeEvent:
            self.eventImageView.image = [UIImage imageNamed:self.imageID];
            self.typeLabel.text = @"Fashion Show";
            self.actionButton.text = @"Get Tickets";
            break;
        case kVSImageTypeShopper:
            self.eventImageView.image = [UIImage imageNamed:self.imageID];
            self.typeLabel.text = @"Personal Shopper";
            self.actionButton.text = @"Book Now";
            break;
        default:
            break;
    }
    
   
    
    
    
}



@end
