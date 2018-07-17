//
//  NKSubscription.m
//  NookoPayments
//
//  Created by Lorenzo Oliveto on 17/07/18.
//  Copyright © 2018 Mumble. All rights reserved.
//

#import "NKSubscription.h"

@implementation NKSubscription

- (instancetype) initWithResponseDictionary: (NSDictionary *) responseDictionary {
    self = [super init];
    if (self){
        self.subscriptionId = [responseDictionary[@"id"] integerValue];
        self.subscriptionName = responseDictionary[@"name"];
        self.stripeId = responseDictionary[@"stripe_id"];
        self.stripePlan = responseDictionary[@"stripe_plan"];
        self.quantity = [responseDictionary[@"quantity"] integerValue];
        if (responseDictionary[@"ends_at"] != [NSNull null]){
            self.endsAt = [NSDate dateWithTimeIntervalSince1970: [responseDictionary[@"ends_at"] integerValue]];
        }
        if (responseDictionary[@"trial_ends_at"] != [NSNull null]){
            self.trialEndsAt = [NSDate dateWithTimeIntervalSince1970: [responseDictionary[@"trial_ends_at"] integerValue]];
        }
        if (responseDictionary[@"created_at"] != [NSNull null]){
            self.createdAt = [NSDate dateWithTimeIntervalSince1970: [responseDictionary[@"created_at"] integerValue]];
        }
        if (responseDictionary[@"expires_at"] != [NSNull null]){
            self.expiresAt = [NSDate dateWithTimeIntervalSince1970: [responseDictionary[@"expires_at"] integerValue]];
        }
        
        self.valid = [responseDictionary[@"valid"] boolValue];
        self.onTrial = [responseDictionary[@"trial"] boolValue];
        self.inGracePeriod = [responseDictionary[@"grace_period"] boolValue];
        self.cancelled = [responseDictionary[@"cancelled"] boolValue];
    }
    return self;
}

#pragma mark - NSCoding, NSSecureCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeInteger:_subscriptionId forKey:@"subscriptionId"];
    [aCoder encodeObject:_subscriptionName forKey:@"subscriptionName"];
    [aCoder encodeObject:_stripeId forKey:@"stripeId"];
    [aCoder encodeObject:_stripePlan forKey:@"stripePlan"];
    [aCoder encodeInteger:_quantity forKey:@"quantity"];
    [aCoder encodeObject:_endsAt forKey:@"endsAt"];
    [aCoder encodeObject:_trialEndsAt forKey:@"trialEndsAt"];
    [aCoder encodeObject:_createdAt forKey:@"createdAt"];
    [aCoder encodeObject:_expiresAt forKey:@"expiresAt"];
    [aCoder encodeBool:_valid forKey:@"valid"];
    [aCoder encodeBool:_onTrial forKey:@"onTrial"];
    [aCoder encodeBool:_inGracePeriod forKey:@"inGracePeriod"];
    [aCoder encodeBool:_cancelled forKey:@"cancelled"];
}

- (instancetype) initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self){
        self.subscriptionId = [aDecoder decodeIntegerForKey:@"subscriptionId"];
        self.subscriptionName = [aDecoder decodeObjectOfClass:NSString.class forKey:@"subscriptionName"];
        self.stripeId = [aDecoder decodeObjectOfClass:NSString.class forKey:@"stripeId"];
        self.stripePlan = [aDecoder decodeObjectOfClass:NSString.class forKey:@"stripePlan"];
        self.quantity = [aDecoder decodeIntegerForKey:@"quantity"];
        self.endsAt = [aDecoder decodeObjectOfClass:NSDate.class forKey:@"endsAt"];
        self.trialEndsAt = [aDecoder decodeObjectOfClass:NSDate.class forKey:@"trialEndsAt"];
        self.createdAt = [aDecoder decodeObjectOfClass:NSDate.class forKey:@"createdAt"];
        self.expiresAt = [aDecoder decodeObjectOfClass:NSDate.class forKey:@"expiresAt"];
        self.valid = [aDecoder decodeBoolForKey:@"valid"];
        self.onTrial = [aDecoder decodeBoolForKey:@"onTrial"];
        self.inGracePeriod = [aDecoder decodeBoolForKey:@"inGracePeriod"];
        self.cancelled = [aDecoder decodeBoolForKey:@"cancelled"];
    }
    return self;
}

+ (BOOL) supportsSecureCoding {
    return TRUE;
}

@end
