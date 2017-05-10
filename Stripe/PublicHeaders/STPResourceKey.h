//
//  STPResourceKey.h
//  Stripe
//
//  Created by Ben Guo on 5/4/17.
//  Copyright © 2017 Stripe, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "STPAPIResponseDecodable.h"

NS_ASSUME_NONNULL_BEGIN

/**
 // TODO docs, more fields, etc.
 */
@interface STPResourceKey : NSObject <STPAPIResponseDecodable>

/**
 The resource key
 */
@property (nonatomic, readonly) NSString *key;

/**
 When the key expires
 */
@property (nonatomic, readonly) NSDate *expirationDate;

/**
 *  You cannot directly instantiate an `STPResourceKey`. You should instead use
 *  `decodedObjectFromAPIResponse:` to create a key from a JSON response.
 */
- (nonnull instancetype) init __attribute__((unavailable("You cannot directly instantiate an STPResourceKey. You should instead use `decodedObjectFromAPIResponse:` to create a key from a JSON response.")));

@end

NS_ASSUME_NONNULL_END
