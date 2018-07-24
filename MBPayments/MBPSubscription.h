//
//  MBSubscription.h
//  MBurger
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 A subscription, a recurrent payment.
 */
@interface MBSubscription : NSObject <NSCoding, NSSecureCoding>

/**
 The id of the subscription.
 */
@property (nonatomic, assign) NSInteger subscriptionId;

/**
 The name of the subscription.
 */
@property (nonatomic, retain, nullable) NSString *subscriptionName;

/**
 The id of the subscription in Stripe.
 */
@property (nonatomic, retain, nullable) NSString *stripeId;

/**
 The name of the Stripe plan of the subscription.
 */
@property (nonatomic, retain, nullable) NSString *stripePlan;

/**
 The quantity of the subscription.
 */
@property (nonatomic, assign) NSInteger quantity;

/**
 When the subscription will end.
 */
@property (nonatomic, retain, nullable) NSDate *endsAt;

/**
 When the trials will end.
 */
@property (nonatomic, retain, nullable) NSDate *trialEndsAt;

/**
 When the subscription has been created.
 */
@property (nonatomic, retain, nullable) NSDate *createdAt;

/**
 When the subscription will expire.
 */
@property (nonatomic, retain, nullable) NSDate *expiresAt;

/**
 Return true if the subscription is already valid.
 */
@property (nonatomic, assign) BOOL valid;

/**
 Return true if the subscription is in the trial period.
 */
@property (nonatomic, assign) BOOL onTrial;

/**
 Return true if the subscription is in grace period, it has been cancelled but it's not expired yet.
 */
@property (nonatomic, assign) BOOL inGracePeriod;

/**
 Return true if the subscription has been cancelled.
 */
@property (nonatomic, assign) BOOL cancelled;

/**
 Initializes a subscription with the dictionary returned by the api.
 
 @param dictionary The response from the api.
 @return A newly created `NKSubscription` initialized with the data of the dictionary.
 */
- (nonnull instancetype) initWithDictionary: (nonnull NSDictionary *) dictionary;

@end
