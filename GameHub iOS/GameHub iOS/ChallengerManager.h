//
//  ChallengerManager.h
//  GameHub iOS
//
//  Created by Dave Laszczak on 2015-03-14.
//  Copyright (c) 2015 Dave Laszczak. All rights reserved.
//

#import "AKObjectManager.h"

@class Challenger;

@interface ChallengerManager : AKObjectManager

- (void) loadAllChallengers:(void (^)(NSArray *challengerList))success failure:(void (^)(RKObjectRequestOperation *operation, NSError *error))failure;

- (void) loadUser:( NSDictionary *)name : (void (^)(Challenger *))success failure:(void (^)(RKObjectRequestOperation *operation, NSError *error))failure;


@end
