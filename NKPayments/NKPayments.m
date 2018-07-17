//
//  NKPayments.m
//  NookoPayments
//
//  Created by Lorenzo Oliveto on 17/07/18.
//  Copyright © 2018 Mumble. All rights reserved.
//

#import "NKPayments.h"
#import "NKManager.h"
#import "NKApiManager.h"

@implementation NKPayments

+ (void) createCustomerForCurrentUserWithSuccess: (void (^)(void)) success
                                         Failure: (void (^)(NSError *error)) failure {
    [NKApiManager callApiWithApiToken:NKManager.sharedManager.apiToken
                               Locale:[NKManager.sharedManager localeString]
                              ApiName:@"customers"
                           HTTPMethod:NKHTTPMethodPost
                           Parameters:nil
                     HeaderParameters:nil
                          Development:[NKManager sharedManager].development
                              Success:^(NKResponse *response) {
                                  if (success){
                                      success();
                                  }
                              } Failure:^(NSError *error) {
                                  if (failure){
                                      failure(error);
                                  }
                              }];
}

+ (void) createSubscription: (NSString *) subscription
                      Token: (NSString *) token
               DiscountCode: (NSString *) discountCode
                  TrialDays: (NSArray *) trialDays
                   Quantity: (NSInteger) quantity
                       Meta: (NSString *) meta
                    Success: (void (^)(void)) success
                    Failure: (void (^)(NSError *error)) failure {
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc] init];

    parameters[@"subscription"] = subscription;
    
    if (token){
        parameters[@"token"] = token;
    }
    if (discountCode){
        parameters[@"discount_code"] = discountCode;
    }
    if (trialDays){
        parameters[@"trial_days"] = trialDays;
    }
    if (quantity != 0){
        parameters[@"quantity"] = @(quantity);
    }
    if (meta){
        parameters[@"meta"] = meta;
    }

    [NKApiManager callApiWithApiToken:NKManager.sharedManager.apiToken
                               Locale:[NKManager.sharedManager localeString]
                              ApiName:@"subscriptions"
                           HTTPMethod:NKHTTPMethodPost
                           Parameters:parameters
                     HeaderParameters:nil
                          Development:[NKManager sharedManager].development
                              Success:^(NKResponse *response) {
                                  if (success){
                                      success();
                                  }
                              } Failure:^(NSError *error) {
                                  if (failure){
                                      failure(error);
                                  }
                              }];
}

+ (void) cancelSubscription: (NSString *) subscription
                    Success: (void (^)(void)) success
                    Failure: (void (^)(NSError *error)) failure {
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc] init];
    
    parameters[@"subscription"] = subscription;
    
    [NKApiManager callApiWithApiToken:NKManager.sharedManager.apiToken
                               Locale:[NKManager.sharedManager localeString]
                              ApiName:@"subscriptions/cancel"
                           HTTPMethod:NKHTTPMethodPost
                           Parameters:parameters
                     HeaderParameters:nil
                          Development:[NKManager sharedManager].development
                              Success:^(NKResponse *response) {
                                  if (success){
                                      success();
                                  }
                              } Failure:^(NSError *error) {
                                  if (failure){
                                      failure(error);
                                  }
                              }];
}

+ (void) resumeSubscription: (NSString *) subscription
                    Success: (void (^)(void)) success
                    Failure: (void (^)(NSError *error)) failure {
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc] init];
    
    parameters[@"subscription"] = subscription;
    
    [NKApiManager callApiWithApiToken:NKManager.sharedManager.apiToken
                               Locale:[NKManager.sharedManager localeString]
                              ApiName:@"subscriptions/resume"
                           HTTPMethod:NKHTTPMethodPost
                           Parameters:parameters
                     HeaderParameters:nil
                          Development:[NKManager sharedManager].development
                              Success:^(NKResponse *response) {
                                  if (success){
                                      success();
                                  }
                              } Failure:^(NSError *error) {
                                  if (failure){
                                      failure(error);
                                  }
                              }];
}

+ (void) createPayment: (NSString *) payment
                Amount: (float) amount
              Quantity: (NSInteger) quantity
                 Token: (NSString *) token
                  Meta: (NSString *) meta
               Success: (void (^)(void)) success
               Failure: (void (^)(NSError *error)) failure {
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc] init];
    
    parameters[@"name"] = payment;
    parameters[@"amount"] = @(amount);
    parameters[@"quantity"] = @(quantity);

    if (token){
        parameters[@"token"] = token;
    }
    if (meta){
        parameters[@"meta"] = meta;
    }
    
    [NKApiManager callApiWithApiToken:NKManager.sharedManager.apiToken
                               Locale:[NKManager.sharedManager localeString]
                              ApiName:@"payments"
                           HTTPMethod:NKHTTPMethodPost
                           Parameters:parameters
                     HeaderParameters:nil
                          Development:[NKManager sharedManager].development
                              Success:^(NKResponse *response) {
                                  if (success){
                                      success();
                                  }
                              } Failure:^(NSError *error) {
                                  if (failure){
                                      failure(error);
                                  }
                              }];
}

+ (void) createCardWithToken: (NSString *) token
                     Success: (void (^)(void)) success
                     Failure: (void (^)(NSError *error)) failure {
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc] init];
    
    parameters[@"token"] = token;
    
    [NKApiManager callApiWithApiToken:NKManager.sharedManager.apiToken
                               Locale:[NKManager.sharedManager localeString]
                              ApiName:@"cards"
                           HTTPMethod:NKHTTPMethodPost
                           Parameters:parameters
                     HeaderParameters:nil
                          Development:[NKManager sharedManager].development
                              Success:^(NKResponse *response) {
                                  if (success){
                                      success();
                                  }
                              } Failure:^(NSError *error) {
                                  if (failure){
                                      failure(error);
                                  }
                              }];
}

+ (void) getCardsWithSuccess: (nullable void (^)(NSArray <NKCard *> *cards)) success
                     Failure: (nullable void (^)(NSError *error)) failure {
    [NKApiManager callApiWithApiToken:NKManager.sharedManager.apiToken
                               Locale:[NKManager.sharedManager localeString]
                              ApiName:@"cards"
                           HTTPMethod:NKHTTPMethodGet
                           Parameters:nil
                     HeaderParameters:nil
                          Development:[NKManager sharedManager].development
                              Success:^(NKResponse *response) {
                                  NSArray *cardsResponse = response.payload[@"data"];
                                  NSMutableArray *cards = [[NSMutableArray alloc] init];
                                  for (NSDictionary *cardDictionary in cardsResponse) {
                                      [cards addObject:[[NKCard alloc] initWithDictionary:cardDictionary]];
                                  }
                                  if (success){
                                      success(cards);
                                  }
                              } Failure:^(NSError *error) {
                                  if (failure){
                                      failure(error);
                                  }
                              }];
}

+ (void) setDefaultCardWithCardId: (NSString *) cardId
                          Success: (void (^)(void)) success
                          Failure: (void (^)(NSError *error)) failure {
    [NKApiManager callApiWithApiToken:NKManager.sharedManager.apiToken
                               Locale:[NKManager.sharedManager localeString]
                              ApiName:[NSString stringWithFormat:@"cards/%@", cardId]
                           HTTPMethod:NKHTTPMethodGet
                           Parameters:nil
                     HeaderParameters:nil
                          Development:[NKManager sharedManager].development
                              Success:^(NKResponse *response) {
                                  if (success){
                                      success();
                                  }
                              } Failure:^(NSError *error) {
                                  if (failure){
                                      failure(error);
                                  }
                              }];
}

+ (void) deleteCardWithCardId: (NSString *) cardId
                      Success: (void (^)(void)) success
                      Failure: (void (^)(NSError *error)) failure {
    [NKApiManager callApiWithApiToken:NKManager.sharedManager.apiToken
                               Locale:[NKManager.sharedManager localeString]
                              ApiName:[NSString stringWithFormat:@"cards/%@", cardId]
                           HTTPMethod:NKHTTPMethodDelete
                           Parameters:nil
                     HeaderParameters:nil
                          Development:[NKManager sharedManager].development
                              Success:^(NKResponse *response) {
                                  if (success){
                                      success();
                                  }
                              } Failure:^(NSError *error) {
                                  if (failure){
                                      failure(error);
                                  }
                              }];
}

#pragma mark - NKPlugin

NSString * const NKPaymentsUserKey = @"NKPaymentsUserKey";

- (id<NSCoding,NSSecureCoding>)objectForUserResponse:(NSDictionary *)userResponse {
    NKUserPaymentSettings *settings = [[NKUserPaymentSettings alloc] initWithUserResponse:userResponse];
    return settings;
}

- (NSString *) pluginUserKey {
    return NKPaymentsUserKey;
}

@end
