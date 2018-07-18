//
//  NKPayments.h
//  NookoPayments
//
//  Created by Lorenzo Oliveto on 17/07/18.
//  Copyright © 2018 Mumble. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NKUserPaymentSettings.h"
#import "NKCard.h"

@import NookoSDK;

FOUNDATION_EXPORT NSString * const NKPaymentsUserKey;

@interface NKPayments : NSObject <NKPlugin>

#pragma mark - Customers

+ (void) createCustomerForCurrentUserWithSuccess: (nullable void (^)(void)) success
                                         Failure: (nullable void (^)(NSError * _Nonnull error)) failure;

#pragma mark - Subscriptions

+ (void) createSubscription: (nonnull NSString *) subscription
                      Token: (nullable NSString *) token
               DiscountCode: (nullable NSString *) discountCode
                  TrialDays: (nullable NSArray *) trialDays
                   Quantity: (NSInteger) quantity
                       Meta: (nullable NSString *) meta
                    Success: (nullable void (^)(void)) success
                    Failure: (nullable void (^)(NSError * _Nonnull error)) failure;

+ (void) cancelSubscription: (nonnull NSString *) subscription
                    Success: (nullable void (^)(void)) success
                    Failure: (nullable void (^)(NSError * _Nonnull error)) failure;

+ (void) resumeSubscription: (nonnull NSString *) subscription
                    Success: (nullable void (^)(void)) success
                    Failure: (nullable void (^)(NSError * _Nonnull error)) failure;

#pragma mark - Payments

+ (void) createPayment: (nonnull NSString *) payment
                Amount: (float) amount
              Quantity: (NSInteger) quantity
                 Token: (nullable NSString *) token
                  Meta: (nullable NSString *) meta
               Success: (nullable void (^)(void)) success
               Failure: (nullable void (^)(NSError * _Nonnull error)) failure;

#pragma mark - Cards

+ (void) createCardWithToken: (nonnull NSString *) token
                     Success: (nullable void (^)(void)) success
                     Failure: (nullable void (^)(NSError * _Nonnull error)) failure;

+ (void) getCardsWithSuccess: (nullable void (^)(NSArray <NKCard *> * _Nonnull cards)) success
                     Failure: (nullable void (^)(NSError * _Nonnull error)) failure;

+ (void) setDefaultCardWithCardId: (NSString *) cardId
                          Success: (nullable void (^)(void)) success
                          Failure: (nullable void (^)(NSError * _Nonnull error)) failure;

+ (void) deleteCardWithCardId: (NSString *) cardId
                      Success: (nullable void (^)(void)) success
                      Failure: (nullable void (^)(NSError * _Nonnull error)) failure;

@end
