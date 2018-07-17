//
//  NKDateElement.h
//  NookoSDK
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import "NKElement.h"

/**
 This class represents a Nooko date element.
 */
@interface NKDateElement : NKElement <NSCoding, NSSecureCoding>

/**
 The value of the element.
*/
@property (nonatomic, retain, nullable) NSDate *date;

/**
 Initializes a date element with an elementId, a name, and its value.
 This function calls the super initializer initWithElementId:Name:Type
 @see This function calls the super initializer `-[NKElement initWithElementId:Name:Order:Type:]`

 @param elementId The id of the element.
 @param name The name of the element.
 @param order The order of the element.
 @param date The date of the element.
 
 @return A newly created NKWysiwygElement initialized with the elementId, the name and the value passed.
 */
- (nonnull instancetype) initWithElementId: (NSInteger) elementId Name: (nonnull NSString *) name Order: (NSInteger) order Date: (nullable NSDate *) date;

@end
