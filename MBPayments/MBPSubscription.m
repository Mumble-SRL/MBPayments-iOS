//
//  MBPSubscription.m
//  MBPayments
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import "MBPSubscription.h"

@implementation MBPSubscription

- (instancetype) initWithDictionary: (NSDictionary *) dictionary {
    self = [super init];
    if (self){
        self.subscriptionId = [dictionary[@"id"] integerValue];
        self.subscriptionName = dictionary[@"name"];
        self.stripeId = dictionary[@"stripe_id"];
        self.stripePlan = dictionary[@"stripe_plan"];
        self.quantity = [dictionary[@"quantity"] integerValue];
        if (dictionary[@"ends_at"] != [NSNull null]){
            self.endsAt = [NSDate dateWithTimeIntervalSince1970: [dictionary[@"ends_at"] integerValue]];
        }
        if (dictionary[@"trial_ends_at"] != [NSNull null]){
            self.trialEndsAt = [NSDate dateWithTimeIntervalSince1970: [dictionary[@"trial_ends_at"] integerValue]];
        }
        if (dictionary[@"created_at"] != [NSNull null]){
            self.createdAt = [NSDate dateWithTimeIntervalSince1970: [dictionary[@"created_at"] integerValue]];
        }
        if (dictionary[@"expires_at"] != [NSNull null]){
            self.expiresAt = [NSDate dateWithTimeIntervalSince1970: [dictionary[@"expires_at"] integerValue]];
        }
        
        self.valid = [dictionary[@"valid"] boolValue];
        self.onTrial = [dictionary[@"trial"] boolValue];
        self.inGracePeriod = [dictionary[@"grace_period"] boolValue];
        self.cancelled = [dictionary[@"cancelled"] boolValue];
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
