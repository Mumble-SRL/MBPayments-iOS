//
//  NKUserPaymentSettings.m
//  NookoPayments
//
//  Created by Lorenzo Oliveto on 17/07/18.
//  Copyright © 2018 Mumble. All rights reserved.
//

#import "NKUserPaymentSettings.h"

@implementation NKUserPaymentSettings

- (instancetype) initWithUserResponse: (NSDictionary *) userResponse {
    self = [super init];
    if (self){
        self.stripeId = userResponse[@"stripe_id"];
        self.cardBrand = userResponse[@"card_brand"];
        self.cardLast4 = userResponse[@"card_last_four"];
        self.trialEndsAt = userResponse[@"trial_ends_at"];
        if (userResponse[@"subscriptions"]){
            NSArray *responseSubscriptions = userResponse[@"subscriptions"];
            NSMutableArray *subscriptions = [[NSMutableArray alloc] init];
            for (NSDictionary *subscriptionDict in responseSubscriptions) {
                NKSubscription *subscription = [[NKSubscription alloc] initWithResponseDictionary:subscriptionDict];
                [subscriptions addObject:subscription];
            }
            self.subscriptions = subscriptions;
        }
        if (userResponse[@"purchases"]){
            NSArray *responsePurchases = userResponse[@"purchases"];
            NSMutableArray *purchases = [[NSMutableArray alloc] init];
            for (NSDictionary *purchaseDict in responsePurchases) {
                NKPurchase *purchase = [[NKPurchase alloc] initWithResponseDictionary:purchaseDict];
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
