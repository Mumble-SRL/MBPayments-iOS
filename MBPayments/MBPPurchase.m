//
//  MBPPurchase.m
//  MBPayments
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import "MBPPurchase.h"

@implementation MBPPurchase

- (instancetype) initWithDictionary: (NSDictionary *) dictionary {
    self = [super init];
    if (self){
        self.purchaseId = [dictionary[@"id"] integerValue];
        self.purchaseName = dictionary[@"purchaseName"];
        self.quantity = [dictionary[@"quantity"] integerValue];
        self.createdAt = [NSDate dateWithTimeIntervalSince1970: [dictionary[@"createdAt"] integerValue]];
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
