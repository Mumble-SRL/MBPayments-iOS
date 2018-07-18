//
//  NKUserPaymentSettings.h
//  NookoPayments
//
//  Created by Lorenzo Oliveto on 17/07/18.
//  Copyright © 2018 Mumble. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NKSubscription.h"
#import "NKPurchase.h"

@import NookoSDK;

@interface NKUserPaymentSettings : NSObject <NSCoding, NSSecureCoding>

@property (nonatomic, retain, nullable) NSString *stripeId;

@property (nonatomic, retain, nullable) NSString *cardBrand;

@property (nonatomic, retain, nullable) NSString *cardLast4;

@property (nonatomic, retain, nullable) NSDate *trialEndsAt;

@property (nonatomic, retain, nullable) NSArray <NKSubscription *> *subscriptions;

@property (nonatomic, retain, nullable) NSArray <NKPurchase *> *purchases;

- (nonnull instancetype) initWithUserResponse: (nonnull NSDictionary *) userResponse;

@end
