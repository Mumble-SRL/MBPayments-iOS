//
//  MBPCard.m
//  MBPayments
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import "MBPCard.h"

@implementation MBPCard

- (instancetype) initWithDictionary: (NSDictionary *) dictionary {
    self = [super init];
    if (self){
        self.cardId = dictionary[@"id"];
        self.brand = dictionary[@"brand"];
        self.last4 = dictionary[@"last4"];
        self.expirationMonth = [dictionary[@"exp_month"] unsignedIntegerValue];
        self.expirationYear = [dictionary[@"exp_year"] unsignedIntegerValue];
        self.isDefault = [dictionary[@"default"] boolValue];
    }
    return self;
}

#pragma mark - NSCoding, NSSecureCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_cardId forKey:@"cardId"];
    [aCoder encodeObject:_brand forKey:@"brand"];
    [aCoder encodeObject:_last4 forKey:@"last4"];
    [aCoder encodeInteger:_expirationMonth forKey:@"expirationMonth"];
    [aCoder encodeInteger:_expirationYear forKey:@"expirationYear"];
    [aCoder encodeBool:_isDefault forKey:@"isDefault"];
}

- (instancetype) initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self){
        self.cardId = [aDecoder decodeObjectOfClass:NSString.class forKey:@"cardId"];
        self.brand = [aDecoder decodeObjectOfClass:NSString.class forKey:@"brand"];
        self.last4 = [aDecoder decodeObjectOfClass:NSString.class forKey:@"last4"];
        self.expirationMonth = [aDecoder decodeIntegerForKey:@"expirationMonth"];
        self.expirationYear = [aDecoder decodeIntegerForKey:@"expirationYear"];
        self.isDefault = [aDecoder decodeBoolForKey:@"isDefault"];
    }
    return self;
}

+ (BOOL) supportsSecureCoding {
    return TRUE;
}

@end
