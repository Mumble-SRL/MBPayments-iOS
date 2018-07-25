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
        self.onlyActive = TRUE;
    }
    return self;
}

- (instancetype) initWithOnlyActive: (BOOL) onlyActive {
    self = [super init];
    if (self){
        self.onlyActive = onlyActive;
    }
    return self;
}

- (NSDictionary *) parameterRepresentation {
    NSString *key = @"filter[elements.geofence]";
    NSString *value = self.onlyActive ? @"active" : @"inactive";
    return [[NSDictionary alloc] initWithObjectsAndKeys:value, [MBUtilities urlEncodeStringForString:key], nil];
}

@end
