//
//  STPResourceKey.m
//  Stripe
//
//  Created by Ben Guo on 5/4/17.
//  Copyright © 2017 Stripe, Inc. All rights reserved.
//

#import "STPResourceKey.h"

#import "NSDictionary+Stripe.h"

@interface STPResourceKey ()

@property (nonatomic, readwrite) NSString *key;
@property (nonatomic, readwrite) NSDate *expirationDate;
@property (nonatomic, readwrite, nonnull, copy) NSDictionary *allResponseFields;

@end

@implementation STPResourceKey

+ (NSString *)object {
    return nil; // TODO: what will this be?
}

+ (NSArray *)requiredFields {
    return @[@"contents", @"expires"];
}

+ (instancetype)decodedObjectFromAPIResponse:(NSDictionary *)response {
    NSDictionary *dict = [response stp_dictionaryByRemovingNullsValidatingRequiredFields:[self requiredFields]];
    if (!dict) {
        return nil;
    }
    STPResourceKey *key = [self new];
    key.key = dict[@"contents"];
    key.expirationDate = [NSDate dateWithTimeIntervalSince1970:[dict[@"expires"] doubleValue]];
    key.allResponseFields = dict;
    return key;
}

- (BOOL)isEqual:(id)object {
    if (self == object) {
        return YES;
    }
    if (!object || ![object isKindOfClass:self.class]) {
        return NO;
    }
    return [self isEqualToResourceKey:object];
}

- (BOOL)isEqualToResourceKey:(STPResourceKey *)other {
    return [self.key isEqualToString:other.key]
        && [self.expirationDate isEqual:other.expirationDate];
}

@end
