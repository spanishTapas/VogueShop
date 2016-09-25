//
//  VSShoppingCollectionCell.h
//  VogueShop
//
//  Created by wanming zhang on 9/24/16.
//  Copyright © 2016 Wanming Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VSShoppingCollectionCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel * descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel * priceLabel;
@property (weak, nonatomic) IBOutlet UIImageView * productImage;

@property (weak, nonatomic) IBOutlet UIImageView * saleTagImage;

@property (weak, nonatomic) IBOutlet UIButton * addToCartButton;

@end
