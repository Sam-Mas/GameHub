//
//  GameHubRailsClient.m
//  GameHub iOS
//
//  Created by Dave Laszczak on 2015-03-12.
//  Copyright (c) 2015 Dave Laszczak. All rights reserved.
//

#import "GameHubRailsClient.h"


static NSString *const GameHubAppSecret = @"M6yNxlc1CD";

@interface GameHubRailsClient()


@property (strong, nonatomic) NSURLSession *session;

@end


@implementation GameHubRailsClient


//overwriting init method
-(instancetype)init
{
    self = [super init];
    
    
    if(!self)
        return nil;
    
    
    //create session configurations
    NSURLSessionConfiguration *sessionCongiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    sessionCongiguration.timeoutIntervalForRequest = 30.0;
    sessionCongiguration.timeoutIntervalForResource = 30.0;
    
    
//    //set session handlers
//    NSDictionary *headers = [GameHubUserSession userID] ?
//    @{
//      @"Accept" : @"application/json",
//      @"Content-Type" : @"application/json",
//      @"X-DEVICE-TOKEN" : [GameHubUserSession userID]
//      
//      } :
//    @{
//      @"Accept" : @"application/json",
//      @"Content-Type" : @"application/json",
//      @"X-APP-SECRET" : GameHubAppSecret
//      
//      } ;
    
    [sessionCongiguration setHTTPAdditionalHeaders:headers];
    
    
    //create session
    _session = [NSURLSession sessionWithConfiguration:sessionCongiguration];
    
    
    return self;
    
    
}



+(instancetype)sharedClient
{
    static GameHubRailsClient *_sharedClient = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        
        //cod to be run only once
        _sharedClient =[[GameHubRailsClient alloc] init];
        
        
    });
    
    return _sharedClient;
    
}

@end
