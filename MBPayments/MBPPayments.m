//
//  MBPPayments.m
//  MBPayments
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import "MBPayments.h"
#import "MBManager.h"
#import "MBApiManager.h"

@implementation MBPPayments

+ (void) createCustomerForCurrentUserWithSuccess: (void (^)(void)) success
                                         Failure: (void (^)(NSError *error)) failure {
    [MBApiManager callApiWithApiToken:MBManager.sharedManager.apiToken
                               Locale:[MBManager.sharedManager localeString]
                              ApiName:@"customers"
                           HTTPMethod:MBHTTPMethodPost
                           Parameters:nil
                     HeaderParameters:nil
                          Development:[MBManager sharedManager].development
                              Success:^(MBResponse *response) {
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
                       Meta: (id) meta
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
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:meta options:0 error:nil];
        NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        parameters[@"meta"] = jsonString;
    }

    [MBApiManager callApiWithApiToken:MBManager.sharedManager.apiToken
                               Locale:[MBManager.sharedManager localeString]
                              ApiName:@"subscriptions"
                           HTTPMethod:MBHTTPMethodPost
                           Parameters:parameters
                     HeaderParameters:nil
                          Development:[MBManager sharedManager].development
                              Success:^(MBResponse *response) {
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
    
    [MBApiManager callApiWithApiToken:MBManager.sharedManager.apiToken
                               Locale:[MBManager.sharedManager localeString]
                              ApiName:@"subscriptions/cancel"
                           HTTPMethod:MBHTTPMethodPost
                           Parameters:parameters
                     HeaderParameters:nil
                          Development:[MBManager sharedManager].development
                              Success:^(MBResponse *response) {
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
    
    [MBApiManager callApiWithApiToken:MBManager.sharedManager.apiToken
                               Locale:[MBManager.sharedManager localeString]
                              ApiName:@"subscriptions/resume"
                           HTTPMethod:MBHTTPMethodPost
                           Parameters:parameters
                     HeaderParameters:nil
                          Development:[MBManager sharedManager].development
                              Success:^(MBResponse *response) {
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
                  Meta: (id) meta
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
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:meta options:0 error:nil];
        NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        parameters[@"meta"] = jsonString;
    }
    
    [MBApiManager callApiWithApiToken:MBManager.sharedManager.apiToken
                               Locale:[MBManager.sharedManager localeString]
                              ApiName:@"payments"
                           HTTPMethod:MBHTTPMethodPost
                           Parameters:parameters
                     HeaderParameters:nil
                          Development:[MBManager sharedManager].development
                              Success:^(MBResponse *response) {
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
    
    [MBApiManager callApiWithApiToken:MBManager.sharedManager.apiToken
                               Locale:[MBManager.sharedManager localeString]
                              ApiName:@"cards"
                           HTTPMethod:MBHTTPMethodPost
                           Parameters:parameters
                     HeaderParameters:nil
                          Development:[MBManager sharedManager].development
                              Success:^(MBResponse *response) {
                                  if (success){
                                      success();
                                  }
                              } Failure:^(NSError *error) {
                                  if (failure){
                                      failure(error);
                                  }
                              }];
}

+ (void) getCardsWithSuccess: (nullable void (^)(NSArray <MBPCard *> *cards)) success
                     Failure: (nullable void (^)(NSError *error)) failure {
    [MBApiManager callApiWithApiToken:MBManager.sharedManager.apiToken
                               Locale:[MBManager.sharedManager localeString]
                              ApiName:@"cards"
                           HTTPMethod:MBHTTPMethodGet
                           Parameters:nil
                     HeaderParameters:nil
                          Development:[MBManager sharedManager].development
                              Success:^(MBResponse *response) {
                                  NSArray *cardsResponse = response.payload[@"data"];
                                  NSMutableArray *cards = [[NSMutableArray alloc] init];
                                  for (NSDictionary *cardDictionary in cardsResponse) {
                                      [cards addObject:[[MBPCard alloc] initWithDictionary:cardDictionary]];
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
    [MBApiManager callApiWithApiToken:MBManager.sharedManager.apiToken
                               Locale:[MBManager.sharedManager localeString]
                              ApiName:[NSString stringWithFormat:@"cards/%@", cardId]
                           HTTPMethod:MBHTTPMethodGet
                           Parameters:nil
                     HeaderParameters:nil
                          Development:[MBManager sharedManager].development
                              Success:^(MBResponse *response) {
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
    [MBApiManager callApiWithApiToken:MBManager.sharedManager.apiToken
                               Locale:[MBManager.sharedManager localeString]
                              ApiName:[NSString stringWithFormat:@"cards/%@", cardId]
                           HTTPMethod:MBHTTPMethodDelete
                           Parameters:nil
                     HeaderParameters:nil
                          Development:[MBManager sharedManager].development
                              Success:^(MBResponse *response) {
                                  if (success){
                                      success();
                                  }
                              } Failure:^(NSError *error) {
                                  if (failure){
                                      failure(error);
                                  }
                              }];
}

#pragma mark - MBPlugin

NSString * const MBPaymentsUserKey = @"MBPaymentsUserKey";

- (id<NSCoding,NSSecureCoding>)objectForUserResponse:(NSDictionary *)userResponse {
    MBPUserPaymentSettings *settings = [[MBPUserPaymentSettings alloc] initWithDictionary:userResponse];
    return settings;
}

- (NSString *) pluginUserKey {
    return MBPaymentsUserKey;
}

@end
