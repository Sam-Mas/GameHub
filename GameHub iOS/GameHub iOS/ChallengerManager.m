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

@synthesize loggedInViewController;

+ (instancetype)sharedManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [super sharedManager];
    });
    
    return sharedManager;
}


- (void) loadAllChallengers:(void (^)(NSArray *))success failure:(void (^)(RKObjectRequestOperation *, NSError *))failure {
    [self getObjectsAtPath:@"challengers" parameters:nil success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        if (success) {
            success(mappingResult.array);
        }
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(operation, error);
        }
    }];
}


-(void) loadUser:(NSDictionary *)name : (void (^)(Challenger *))success failure:(void (^)(RKObjectRequestOperation *, NSError *))failure
{
    Challenger *challenger = [Challenger new];
    challenger.name = name[@"name"];

    
    [self postObject:challenger path:@"challengers" parameters:name
    success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult)
     {
         if (success)
         {
              NSLog(@"Login Successful");
             Challenger *currentChallenger = (Challenger *)[mappingResult.array firstObject];
             success(currentChallenger);
         }
     }
    failure:^(RKObjectRequestOperation *operation, NSError *error)
     {
         NSLog(@"Error: %@", error);
         if (failure)
         {
             failure(operation, error);
         }
     }];
}


#pragma mark - Setup Helpers

- (void) setupResponseDescriptors {
    [super setupResponseDescriptors];

    RKObjectMapping *challengerMapping = [MappingProvider getChallengerMapping];
    
    RKResponseDescriptor *challengerResponseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:challengerMapping method:RKRequestMethodAny pathPattern:nil keyPath:@"challengers" statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];

    [self addResponseDescriptor:challengerResponseDescriptor];
}

- (void) setupRequestDescriptors{
    [super setupRequestDescriptors];
    
    RKObjectMapping *challengerRequestMapping = [RKObjectMapping requestMapping];
    [challengerRequestMapping addAttributeMappingsFromArray:@[ @"name"]];
    
    RKRequestDescriptor *challengerRequestDescriptor = [RKRequestDescriptor requestDescriptorWithMapping:challengerRequestMapping objectClass:[Challenger class] rootKeyPath:@"challengers" method:RKRequestMethodAny];
    
    [self addRequestDescriptor:challengerRequestDescriptor];

}



@end
