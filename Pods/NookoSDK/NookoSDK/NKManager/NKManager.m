//
//  NKManager.m
//  NookoSDK
//
//  Copyright © 2018 Mumble s.r.l. (https://mumbleideas.it/).
//  All rights reserved.
//

#import "NKManager.h"

@implementation NKManager

+ (NKManager *) sharedManager {
    static NKManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (NSString *) localeString{
    return [self localeForApi];
}

#pragma mark - Utilities

- (NSString *) localeForApi {
    if (self.locale){
        return [self stringForLocale:self.locale];
    }
    NSArray *preferredLanguages = [NSLocale preferredLanguages];
    if (preferredLanguages.count > 0){
        return [preferredLanguages.firstObject substringToIndex:2];
    }
    return [self stringForLocale:[NSLocale currentLocale]];
}

- (NSString *) stringForLocale: (NSLocale *) locale {
    return [locale.localeIdentifier substringToIndex:2];
}

@end
