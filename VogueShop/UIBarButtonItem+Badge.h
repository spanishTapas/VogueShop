//
//  UIBarButtonItem+Badge.h
//  VogueShop
//
//  Created by wanming zhang on 9/25/16.
//  Copyright © 2016 Wanming Zhang. All rights reserved.
//

/**
Source code: https://github.com/mikeMTOL/UIBarButtonItem-Badge
**/

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@interface UIBarButtonItem (Badge)
@property (strong, atomic) UILabel *badge;

// Badge value to be display
@property (nonatomic) NSString *badgeValue;
// Badge background color
@property (nonatomic) UIColor *badgeBGColor;
// Badge text color
@property (nonatomic) UIColor *badgeTextColor;
// Badge font
@property (nonatomic) UIFont *badgeFont;
// Padding value for the badge
@property (nonatomic) CGFloat badgePadding;
// Minimum size badge to small
@property (nonatomic) CGFloat badgeMinSize;
// Values for offseting the badge over the BarButtonItem you picked
@property (nonatomic) CGFloat badgeOriginX;
@property (nonatomic) CGFloat badgeOriginY;
// In case of numbers, remove the badge when reaching zero
@property BOOL shouldHideBadgeAtZero;
// Badge has a bounce animation when value changes
@property BOOL shouldAnimateBadge;
@end
