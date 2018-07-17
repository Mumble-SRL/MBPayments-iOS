//
//  NKPayment.h
//  NookoPayments
//
//  Created by Lorenzo Oliveto on 17/07/18.
//  Copyright © 2018 Mumble. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NKPurchase : NSObject <NSCoding, NSSecureCoding>

@property (nonatomic, assign) NSInteger purchaseId;

@property (nonatomic, retain, nullable) NSString *purchaseName;

@property (nonatomic, assign) NSInteger quantity;

@property (nonatomic, retain, nullable) NSDate *createdAt;

- (nonnull instancetype) initWithResponseDictionary: (nonnull NSDictionary *) responseDictionary;

@end
