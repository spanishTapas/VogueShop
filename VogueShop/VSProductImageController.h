//
//  VSProductImageController.h
//  VogueShop
//
//  Created by wanming zhang on 9/22/16.
//  Copyright © 2016 Wanming Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, ImageType)
{
    kVSImageTypeProduct					= 0,
    kVSImageTypeEvent,
    kVSImageTypeShopper,
};

@interface VSProductImageController : UIViewController
@property (strong, nonatomic) NSString * imageID;
@property (nonatomic, assign) ImageType imageType;
@end
