//
//  NKCard.h
//  NookoPayments
//
//  Created by Lorenzo Oliveto on 17/07/18.
//  Copyright © 2018 Mumble. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NKCard : NSObject <NSCoding, NSSecureCoding>

@property (nonatomic, retain, nonnull) NSString *cardId;

@property (nonatomic, retain, nonnull) NSString *brand;

@property (nonatomic, retain, nonnull) NSString *last4;

@property (nonatomic, assign) NSUInteger expirationMonth;

@property (nonatomic, assign) NSUInteger expirationYear;

- (nonnull instancetype) initWithDictionary: (nonnull NSDictionary *) dictionary;

@end
