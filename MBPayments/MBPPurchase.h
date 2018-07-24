//
//  MBPPurchase.h
//  MBPayments
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 A single purchase.
 */
@interface MBPPurchase : NSObject <NSCoding, NSSecureCoding>

/**
 The id of the purchase.
 */
@property (nonatomic, assign) NSInteger purchaseId;

/**
 The name of the purchase.
 */
@property (nonatomic, retain, nullable) NSString *purchaseName;

/**
 The quantity of the purchase.
 */
@property (nonatomic, assign) NSInteger quantity;

/**
 When the purchase has been created.
 */
@property (nonatomic, retain, nullable) NSDate *createdAt;

/**
 Initializes a purchase with the dictionary returned by the api.
 
 @param dictionary The response from the api.
 @return A newly created `MBPPurchase` initialized with the data of the dictionary.
 */
- (nonnull instancetype) initWithDictionary: (nonnull NSDictionary *) dictionary;

@end
