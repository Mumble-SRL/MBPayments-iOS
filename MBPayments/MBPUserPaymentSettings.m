//
//  MBPUserPaymentSettings.m
//  MBPayments
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import "MBPUserPaymentSettings.h"

@implementation MBPUserPaymentSettings

- (instancetype) initWithDictionary: (NSDictionary *) dictionary {
    self = [super init];
    if (self){
        self.stripeId = dictionary[@"stripe_id"];
        self.cardBrand = dictionary[@"card_brand"];
        self.cardLast4 = dictionary[@"card_last_four"];
        self.trialEndsAt = dictionary[@"trial_ends_at"];
        if (dictionary[@"subscriptions"]){
            NSArray *responseSubscriptions = dictionary[@"subscriptions"];
            NSMutableArray *subscriptions = [[NSMutableArray alloc] init];
            for (NSDictionary *subscriptionDict in responseSubscriptions) {
                MBPSubscription *subscription = [[MBPSubscription alloc] initWithDictionary:subscriptionDict];
                [subscriptions addObject:subscription];
            }
            self.subscriptions = subscriptions;
        }
        if (dictionary[@"purchases"]){
            NSArray *responsePurchases = dictionary[@"purchases"];
            NSMutableArray *purchases = [[NSMutableArray alloc] init];
            for (NSDictionary *purchaseDict in responsePurchases) {
                MBPPurchase *purchase = [[MBPPurchase alloc] initWithDictionary:purchaseDict];
                [purchases addObject:purchase];
            }
            self.purchases = purchases;
        }
    }
    return self;
}

#pragma mark - NSCoding, NSSecureCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_stripeId forKey:@"stripeId"];
    [aCoder encodeObject:_cardBrand forKey:@"cardBrand"];
    [aCoder encodeObject:_cardLast4 forKey:@"cardLast4"];
    [aCoder encodeObject:_trialEndsAt forKey:@"trialEndsAt"];
    [aCoder encodeObject:_subscriptions forKey:@"subscriptions"];
    [aCoder encodeObject:_purchases forKey:@"purchases"];
}

- (instancetype) initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self){
        self.stripeId = [aDecoder decodeObjectOfClass:NSString.class forKey:@"stripeId"];
        self.cardBrand = [aDecoder decodeObjectOfClass:NSString.class forKey:@"cardBrand"];
        self.cardLast4 = [aDecoder decodeObjectOfClass:NSString.class forKey:@"cardLast4"];
        self.trialEndsAt = [aDecoder decodeObjectOfClass:NSDate.class forKey:@"trialEndsAt"];
        self.subscriptions = [aDecoder decodeObjectOfClass:NSArray.class forKey:@"subscriptions"];
        self.purchases = [aDecoder decodeObjectOfClass:NSArray.class forKey:@"purchases"];
    }
    return self;
}

+ (BOOL) supportsSecureCoding {
    return TRUE;
}

@end
