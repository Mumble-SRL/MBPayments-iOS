//
//  MBPCard.h
//  MBPayments
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 This object represents a credit card.
 */
@interface MBPCard : NSObject <NSCoding, NSSecureCoding>

/**
 The id of the credit card.
 */
@property (nonatomic, retain, nonnull) NSString *cardId;

/**
 The brand of the card.
 */
@property (nonatomic, retain, nonnull) NSString *brand;

/**
 The last 4 numbers of the card.
 */
@property (nonatomic, retain, nonnull) NSString *last4;

/**
 The month of expiration of the card.
 */
@property (nonatomic, assign) NSUInteger expirationMonth;

/**
 The year of expiration of the card.
 */
@property (nonatomic, assign) NSUInteger expirationYear;

/**
 Initializes a card with the dictionary returned by the api.
 
 @param dictionary The response from the api.
 @return A newly created `MBPCard` initialized with the data of the dictionary.
 */
- (nonnull instancetype) initWithDictionary: (nonnull NSDictionary *) dictionary;

@end
