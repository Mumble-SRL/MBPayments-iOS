//
//  NKPayment.m
//  NookoPayments
//
//  Created by Lorenzo Oliveto on 17/07/18.
//  Copyright © 2018 Mumble. All rights reserved.
//

#import "NKPurchase.h"

@implementation NKPurchase

- (instancetype) initWithResponseDictionary: (NSDictionary *) responseDictionary {
    self = [super init];
    if (self){
        self.purchaseId = [responseDictionary[@"id"] integerValue];
        self.purchaseName = responseDictionary[@"purchaseName"];
        self.quantity = [responseDictionary[@"quantity"] integerValue];
        self.createdAt = [NSDate dateWithTimeIntervalSince1970: [responseDictionary[@"createdAt"] integerValue]];
    }
    return self;
}

#pragma mark - NSCoding, NSSecureCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeInteger:_purchaseId forKey:@"purchaseId"];
    [aCoder encodeObject:_purchaseName forKey:@"purchaseName"];
    [aCoder encodeInteger:_quantity forKey:@"quantity"];
    [aCoder encodeObject:_createdAt forKey:@"createdAt"];
}

- (instancetype) initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self){
        self.purchaseId = [aDecoder decodeIntegerForKey:@"purchaseId"];
        self.purchaseName = [aDecoder decodeObjectOfClass:NSString.class forKey:@"purchaseName"];
        self.quantity = [aDecoder decodeIntegerForKey:@"quantity"];
        self.createdAt = [aDecoder decodeObjectOfClass:NSDate.class forKey:@"createdAt"];
    }
    return self;
}

+ (BOOL) supportsSecureCoding {
    return TRUE;
}

@end
