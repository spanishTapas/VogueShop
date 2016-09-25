//
//  VSProduct.m
//  VogueShop
//
//  Created by wanming zhang on 9/24/16.
//  Copyright © 2016 Wanming Zhang. All rights reserved.
//

#import "VSProduct.h"

@implementation VSProduct

//- (instancetype)initWithJSONObject:(NSDictionary *)json {
//    self = [super init];
//    
//    if (self) {
//        self.serialNumber = RCString(json[@"serialNumber"]);
//        self.eventNumber = RCString(json[@"diagnosticEventNumber"]);
//        self.endResult = RCString(json[@"diagnosticEventEndResult"]);
//        self.passCount = RCString(json[@"modulePassCount"]);
//        self.startTime = [NSDate dateFromEpochStringInMilliseconds:RCString(json[@"diagnosticStartTimeStamp"])];
//        self.endTimeString = RCString(json[@"diagnosticEndTimeStamp"]);
//        self.toolID = RCString(json[@"suite"]);
//        self.channelID = RCString(json[@"channelId"]);
//        self.diagnosticsSystemID = RCString(json[@"systemId"]);
//        self.captureID = RCString(json[@"captureId"]);
//    }
//    
//    return self;
//}

- (id)initWithCoder:(NSCoder *)coder {
    if (!(self = [super init])) {
        return nil;
    }
    self.productDescription = [coder decodeObjectForKey:@"productDescription"];
    self.imageID = [coder decodeObjectForKey:@"imageID"];
    self.price = [coder decodeObjectForKey:@"price"];
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.productDescription forKey:@"productDescription"];
    [coder encodeObject:self.imageID forKey:@"imageID"];
    [coder encodeObject:self.price forKey:@"price"];
}

- (id)copyWithZone:(NSZone *)zone {
    VSProduct * copy = [[VSProduct alloc] init];
    copy.productDescription = [self.productDescription copy];
    copy.imageID = [self.imageID copy];
    copy.price = [self.price copy];
    
    return copy;
}


@end
