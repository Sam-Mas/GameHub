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

#import "LoggedInViewController.h"


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

//- (void)postObject:(id)object
//              path:(NSString *)path
//        parameters:(NSDictionary *)parameters
//           success:(void (^)(RKObjectRequestOperation *operation, RKMappingResult *mappingResult))success
//           failure:(void (^)(RKObjectRequestOperation *operation, NSError *error))failure;


-(void) loadUser:(NSDictionary *)name : (void (^)(Challenger *))success failure:(void (^)(RKObjectRequestOperation *, NSError *))failure
{
    Challenger *challenger = [Challenger new];
    challenger.name = name[@"name"];
//    [self postObject:challenger path:@"challengers" parameters:name success:nil failure:nil];
    
    [self postObject:challenger path:@"challengers" parameters:name
    success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult)
     {
         if (success)
         {
              NSLog(@"hey Bitches-----------");
             Challenger *currentChallenger = (Challenger *)[mappingResult.array firstObject];
             success(currentChallenger);
             
             
         }
         
         
         NSLog(@"************user is: %@ *************", challenger.name);
         
         LoggedInViewController *loggedInViewController = [LoggedInViewController alloc] ;
         //]initWithNibName:@"LoggedInViewController" bundle:nil];
         
         loggedInViewController.challenger = challenger;
         
         [loggedInViewController doWork];
         
         //        [self presentViewController:self.loggedInViewController animated:YES completion:nil];

        
         
         
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
    
//    RKResponseDescriptor *authenticatedChallengerResponseDescriptors = [RKResponseDescriptor responseDescriptorWithMapping:[MappingProvider challengerMapping] method:RKRequestMethodGET pathPattern:@"challengers" keyPath:nil statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    RKObjectMapping *challengerMapping = [MappingProvider getChallengerMapping];
    
    RKResponseDescriptor *challengerResponseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:challengerMapping method:RKRequestMethodAny pathPattern:nil keyPath:@"challengers" statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];

    [self addResponseDescriptor:challengerResponseDescriptor];
}

- (void) setupRequestDescriptors{
    [super setupRequestDescriptors];
    
    
//    RKObjectMapping *challengerRequestMapping = [MappingProvider getChallengerMapping];
        RKObjectMapping *challengerRequestMapping = [RKObjectMapping requestMapping];
        [challengerRequestMapping addAttributeMappingsFromArray:@[ @"name"]];

    
//    [challengerRequestMapping addAttributeMappingsFromArray:@[]]
    
    RKRequestDescriptor *challengerRequestDescriptor = [RKRequestDescriptor requestDescriptorWithMapping:challengerRequestMapping objectClass:[Challenger class] rootKeyPath:@"challengers" method:RKRequestMethodAny];
    
    [self addRequestDescriptor:challengerRequestDescriptor];

}



@end
