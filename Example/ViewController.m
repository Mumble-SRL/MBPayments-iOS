//
//  ViewController.m
//  NookoPayments
//
//  Created by Lorenzo Oliveto on 17/07/18.
//  Copyright © 2018 Mumble. All rights reserved.
//

#import "ViewController.h"
#import "NookoSDK.h"
#import "NKPayments.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    if (![NKAuth userIsLoggedIn]){
        [NKAuth authenticateUserWithEmail:@"enrico.ori.sc@gmail.com"
                                 Password:@"pallapalla"
                                  Success:^(NSString *accessToken) {
                                      [self retrieveUserProfile];
                                  }
                                  Failure:^(NSError *error) {
                                      NSLog(@"%@", error.localizedDescription);
                                  }];
    } else {
        [self retrieveUserProfile];
    }
}

- (void) retrieveUserProfile {
    [NKAuth getUserProfileWithSuccess:^(NKUser *user) {
        NKUserPaymentSettings *paymentSettings = user.pluginsObjects[NKPaymentsUserKey];
        NSLog(@"%@", paymentSettings);
    } Failure:^(NSError * error) {
    }];
    
    [NKPayments getCardsWithSuccess:^(NSArray *cards) {
        
    } Failure:^(NSError * _Nonnull error) {
        
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
