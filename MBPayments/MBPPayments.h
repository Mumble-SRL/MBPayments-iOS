//
//  MBPPayments.h
//  MBPayments
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBPUserPaymentSettings.h"
#import "MBPCard.h"

@import MBurger;

/**
 The key used to fetch the pyaments settings of a user.
 You can access the `MBUserPaymentSettings` object of a `MBUser` like this user.pluginsObjects[MBPaymentsUserKey].
 */
FOUNDATION_EXPORT NSString * _Nonnull const MBPaymentsUserKey;

/**
 The main class used to interact with MBurger Payments. All the calls have to be made with an user authenticated and will return the setting for that user.
 */
@interface MBPPayments : NSObject <MBPlugin>

#pragma mark - Customers

/**
 Creates a customer in MBurger for the current authenticated user.

 @param success A block object to be executed when the task finishes successfully. This block has no return value and takes no arguments.
 @param failure A block object to be executed when the task finishes unsuccessfully, or that finishes successfully, but the server encountered an error. This block has no return value and takes a one argument: the error describing the error that occurred.
 */
+ (void) createCustomerForCurrentUserWithSuccess: (nullable void (^)(void)) success
                                         Failure: (nullable void (^)(NSError * _Nonnull error)) failure;

#pragma mark - Subscriptions

/**
 Creates a subscription for the current authenticated user.

 @param subscription The name of the subscription.
 @param token A Stripe token representing credit card. If it's not provided MBurger will attempt to charge the customer with their default card.
 @param discountCode A discount code.
 @param trialDays The trial days for the subscription.
 @param quantity The quantity of the subscription.
 @param meta Additional metadata passed with the registration. You can include an `NSArray` or `NSDictionary` in this parameter and it will be returned in the subscription. This will be converted in a json string with `NSJSONSerialization`.
 @param success A block object to be executed when the task finishes successfully. This block has no return value and takes no arguments.
 @param failure A block object to be executed when the task finishes unsuccessfully, or that finishes successfully, but the server encountered an error. This block has no return value and takes a one argument: the error describing the error that occurred.
 */
+ (void) createSubscription: (nonnull NSString *) subscription
                      Token: (nullable NSString *) token
               DiscountCode: (nullable NSString *) discountCode
                  TrialDays: (nullable NSArray *) trialDays
                   Quantity: (NSInteger) quantity
                       Meta: (nullable id) meta
                    Success: (nullable void (^)(void)) success
                    Failure: (nullable void (^)(NSError * _Nonnull error)) failure;

/**
 Cancels a subscription and put it in the grace period if it's not expired yet.

 @param subscription The name of the subscription.
 @param success A block object to be executed when the task finishes successfully. This block has no return value and takes no arguments.
 @param failure A block object to be executed when the task finishes unsuccessfully, or that finishes successfully, but the server encountered an error. This block has no return value and takes a one argument: the error describing the error that occurred.
 */
+ (void) cancelSubscription: (nonnull NSString *) subscription
                    Success: (nullable void (^)(void)) success
                    Failure: (nullable void (^)(NSError * _Nonnull error)) failure;

/**
 Resumes a subscription if it's in the grace period.

 @param subscription The name of the subscription.
 @param success A block object to be executed when the task finishes successfully. This block has no return value and takes no arguments.
 @param failure A block object to be executed when the task finishes unsuccessfully, or that finishes successfully, but the server encountered an error. This block has no return value and takes a one argument: the error describing the error that occurred.
 */
+ (void) resumeSubscription: (nonnull NSString *) subscription
                    Success: (nullable void (^)(void)) success
                    Failure: (nullable void (^)(NSError * _Nonnull error)) failure;

#pragma mark - Payments

/**
 Creates a single payments.

 @param payment The payment identifier.
 @param amount Amount of the payment.
 @param quantity Quantoty to buy.
 @param token A Stripe token representing credit card. If it's not provided MBurger will attempt to charge the customer with their default card.
 @param meta Additional metadata passed with the registration. You can include an `NSArray` or `NSDictionary` in this parameter and it will be returned in the subscription. This will be converted in a json string with `NSJSONSerialization`.
 @param success A block object to be executed when the task finishes successfully. This block has no return value and takes no arguments.
 @param failure A block object to be executed when the task finishes unsuccessfully, or that finishes successfully, but the server encountered an error. This block has no return value and takes a one argument: the error describing the error that occurred.
 */
+ (void) createPayment: (nonnull NSString *) payment
                Amount: (float) amount
              Quantity: (NSInteger) quantity
                 Token: (nullable NSString *) token
                  Meta: (nullable id) meta
               Success: (nullable void (^)(void)) success
               Failure: (nullable void (^)(NSError * _Nonnull error)) failure;

#pragma mark - Cards

/**
 Creates a card with a Stripe credit card token. If this is the first card for the user it will be set as default.

 @param token A Stripe token representing credit card.
 @param success A block object to be executed when the task finishes successfully. This block has no return value and takes no arguments.
 @param failure A block object to be executed when the task finishes unsuccessfully, or that finishes successfully, but the server encountered an error. This block has no return value and takes a one argument: the error describing the error that occurred.
 */
+ (void) createCardWithToken: (nonnull NSString *) token
                     Success: (nullable void (^)(void)) success
                     Failure: (nullable void (^)(NSError * _Nonnull error)) failure;

/**
 Retrieves the cards of the current authenticated user.

 @param success A block object to be executed when the task finishes successfully. This block has no return value and takes one argument: the array of cards of the current authenticated user.
 @param failure A block object to be executed when the task finishes unsuccessfully, or that finishes successfully, but the server encountered an error. This block has no return value and takes a one argument: the error describing the error that occurred.
 */
+ (void) getCardsWithSuccess: (nullable void (^)(NSArray <MBPCard *> * _Nonnull cards)) success
                     Failure: (nullable void (^)(NSError * _Nonnull error)) failure;

/**
 Sets a card as default.

 @param cardId The id of the card.
 @param success A block object to be executed when the task finishes successfully. This block has no return value and takes no arguments.
 @param failure A block object to be executed when the task finishes unsuccessfully, or that finishes successfully, but the server encountered an error. This block has no return value and takes a one argument: the error describing the error that occurred.
 */
+ (void) setDefaultCardWithCardId: (nonnull NSString *) cardId
                          Success: (nullable void (^)(void)) success
                          Failure: (nullable void (^)(NSError * _Nonnull error)) failure;

/**
 Deletes a card.

 @param cardId The id of the card.
 @param success A block object to be executed when the task finishes successfully. This block has no return value and takes no arguments.
 @param failure A block object to be executed when the task finishes unsuccessfully, or that finishes successfully, but the server encountered an error. This block has no return value and takes a one argument: the error describing the error that occurred.
 */
+ (void) deleteCardWithCardId: (nonnull NSString *) cardId
                      Success: (nullable void (^)(void)) success
                      Failure: (nullable void (^)(NSError * _Nonnull error)) failure;

@end
