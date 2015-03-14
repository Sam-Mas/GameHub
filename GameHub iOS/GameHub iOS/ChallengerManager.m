//
//  ChallengerManager.m
//  GameHub iOS
//
//  Created by Dave Laszczak on 2015-03-14.
//  Copyright (c) 2015 Dave Laszczak. All rights reserved.
//

#import "ChallengerManager.h"
#import "RestKit.h"
#import "MappingProvider.h"
#import "Challenger.h"


static ChallengerManager *sharedManager = nil;

@implementation ChallengerManager

+ (instancetype)sharedManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [super sharedManager];
    });
    
    return sharedManager;
}


- (void) loadAuthenticatedChallenger:(void (^)(Challenger *))success failure:(void (^)(RKObjectRequestOperation *, NSError *))failure {
    [self getObjectsAtPath:@"challengers" parameters:nil success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        if (success) {
            Challenger *currentChallenger = (Challenger *)[mappingResult.array firstObject];
            success(currentChallenger);
        }
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(operation, error);
        }
    }];
}

#pragma mark - Setup Helpers

- (void) setupResponseDescriptors {
    [super setupResponseDescriptors];
    
    RKResponseDescriptor *authenticatedChallengerResponseDescriptors = [RKResponseDescriptor responseDescriptorWithMapping:[MappingProvider challengerMapping] method:RKRequestMethodGET pathPattern:@"challengers" keyPath:nil statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    [self addResponseDescriptor:authenticatedChallengerResponseDescriptors];
}



@end
