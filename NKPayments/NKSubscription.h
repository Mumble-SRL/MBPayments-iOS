//
//  NKSubscription.h
//  NookoPayments
//
//  Created by Lorenzo Oliveto on 17/07/18.
//  Copyright © 2018 Mumble. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NKSubscription : NSObject <NSCoding, NSSecureCoding>

@property (nonatomic, assign) NSInteger subscriptionId;

@property (nonatomic, retain, nullable) NSString *subscriptionName;

@property (nonatomic, retain, nullable) NSString *stripeId;

@property (nonatomic, retain, nullable) NSString *stripePlan;

@property (nonatomic, assign) NSInteger quantity;

@property (nonatomic, retain, nullable) NSDate *endsAt;

@property (nonatomic, retain, nullable) NSDate *trialEndsAt;

@property (nonatomic, retain, nullable) NSDate *createdAt;

@property (nonatomic, retain, nullable) NSDate *expiresAt;

@property (nonatomic, assign) BOOL valid;

@property (nonatomic, assign) BOOL onTrial;

@property (nonatomic, assign) BOOL inGracePeriod;

@property (nonatomic, assign) BOOL cancelled;

- (nonnull instancetype) initWithResponseDictionary: (nonnull NSDictionary *) responseDictionary;

@end
