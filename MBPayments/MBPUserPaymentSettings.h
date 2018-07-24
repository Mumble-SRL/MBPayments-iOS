//
//  MBUserPaymentSettings.h
//  MBPayments
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBSubscription.h"
#import "NKPurchase.h"

@import MBurger;

/**
 This objects represents the payments settings of a user. It's returned only if a customer is created for the user.
 */
@interface MBUserPaymentSettings : NSObject <NSCoding, NSSecureCoding>

/**
 The Stripe id of the user.
 */
@property (nonatomic, retain, nullable) NSString *stripeId;

/**
 The brand of the default card of the user.
 */
@property (nonatomic, retain, nullable) NSString *cardBrand;

/**
 The last 4 numbers of the default card.
 */
@property (nonatomic, retain, nullable) NSString *cardLast4;

/**
 If the user is in a trial period, the end of the trial.
 */
@property (nonatomic, retain, nullable) NSDate *trialEndsAt;

/**
 All the subscriptions of the user.
 */
@property (nonatomic, retain, nullable) NSArray <MBSubscription *> *subscriptions;

/**
 All the purchases of the user.
 */
@property (nonatomic, retain, nullable) NSArray <NKPurchase *> *purchases;

/**
 Initializes a user payments settings object with the dictionary returned by the api.

 @param dictionary The response from the api.
 @return A newly created `MBUserPaymentSettings` initialized with the data of the dictionary.
 */
- (nonnull instancetype) initWithDictionary: (nonnull NSDictionary *) dictionary;

@end
