//
//  UIBarButtonItem+Badge.h
//  VogueShop
//
//  Created by wanming zhang on 9/25/16.
//  Copyright © 2016 Wanming Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@interface UIBarButtonItem (Badge)

@property (strong, atomic) UILabel * badge;

// Badge value to be displayed
@property (nonatomic) NSString * badgeValue;
// Badge background color
@property (nonatomic) UIColor * badgeBGColor;
// Badge text color
@property (nonatomic) UIColor * badgeTextColor;
// Badge font
@property (nonatomic) UIFont * badgeFont;
// Padding value for the badge
@property (nonatomic) CGFloat badgePadding;
// Minimum badge size
@property (nonatomic) CGFloat badgeMinSize;
// Values for offseting the badge over the BarButtonItem associated
@property (nonatomic) CGFloat badgeOriginX;
@property (nonatomic) CGFloat badgeOriginY;
// Hide the badge when value reaches zero
@property BOOL shouldHideBadgeAtZero;
// Badge has a bounce animation when value changes
@property BOOL shouldAnimateBadge;
@end
