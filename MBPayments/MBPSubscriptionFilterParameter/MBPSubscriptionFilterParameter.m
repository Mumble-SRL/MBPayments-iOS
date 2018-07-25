//
//  MBPSubscriptionFilterParameter.m
//  MBPayments
//
//  Created by Lorenzo Oliveto on 25/07/18.
//  Copyright © 2018 Mumble. All rights reserved.
//

#import "MBPSubscriptionFilterParameter.h"

@implementation MBPSubscriptionFilterParameter

- (instancetype) init {
    self = [super init];
    if (self){
        self.active = TRUE;
    }
    return self;
}

- (instancetype) initWithActive: (BOOL) active {
    self = [super init];
    if (self){
        self.active = active;
    }
    return self;
}

- (NSDictionary *) parameterRepresentation {
    NSString *key = @"filter[subscription]";
    NSString *value = self.active ? @"active" : @"inactive";
    return [[NSDictionary alloc] initWithObjectsAndKeys:value, key, nil];
}

@end
