//
//  MBPSubscriptionFilterParameter.h
//  MBPayments
//
//  Created by Lorenzo Oliveto on 25/07/18.
//  Copyright © 2018 Mumble. All rights reserved.
//

#import <MBurger/MBurger.h>

/**
 Filter that can be used to filter only the sections that belongs to users with an active/inactive subscription.
 */

@interface MBPSubscriptionFilterParameter: NSObject <MBParameter>

/**
 If true this filter will return the sections that belongs to users with an active subscription. Otherwise it will return the sections that belongs to users with an inactive subscription.
 Default value is TRUE.
 */
@property (nonatomic, assign) BOOL onlyActive;

/**
 Initializes a filter for subscription.
 
 @param onlyActive If the it will filter for only the active or inactive subscription.
 
 @return A newly created MBPSubscriptionFilterParameter initialized with the onlyActive flag.
 */
- (nonnull instancetype) initWithOnlyActive: (BOOL) onlyActive;

@end
