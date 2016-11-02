//
//  UIImage+VSAdditions.h
//  VogueShop
//
//  Created by wanming zhang on 9/24/16.
//  Copyright © 2016 Wanming Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (VSAdditions)

- (UIImage *) tintWithColor:(UIColor *)color;

- (UIImage *)resizedImageWithContentMode:(UIViewContentMode)contentMode
                                  bounds:(CGSize)bounds
                    interpolationQuality:(CGInterpolationQuality)quality;
@end
