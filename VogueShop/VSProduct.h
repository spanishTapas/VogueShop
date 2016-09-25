//
//  VSProduct.h
//  VogueShop
//
//  Created by wanming zhang on 9/24/16.
//  Copyright © 2016 Wanming Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VSProduct : NSObject
@property (strong, nonatomic) NSString * productDescription;
@property (strong, nonatomic) NSString * imageID;
@property (strong, nonatomic) NSNumber * price;

@end
