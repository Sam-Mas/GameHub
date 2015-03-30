//
//  AKObjectManager.m
//  GameHub iOS
//
//  Created by Dave Laszczak on 2015-03-13.
//  Copyright (c) 2015 Dave Laszczak. All rights reserved.
//

#import "AKObjectManager.h"
#import <RestKit/RestKit.h>

#define BASE_URL @"http://localhost:3000/api/v1"
#define PERSONAL_ACCESS_TOKEN @"6fba03e4e425010d3bf108717280529f79b5c70a"

@implementation AKObjectManager

+(instancetype)sharedManager{
    
    NSURL *url = [NSURL URLWithString:@"http://gamehub.elasticbeanstalk.com/api/v1/"];  //prod
//    NSURL *url = [NSURL URLWithString:@"http://gamehub-dev.elasticbeanstalk.com/api/v1/"];  //Dev
//    NSURL *url = [NSURL URLWithString:@"http://localhost:3000/api/v1/"];  //local
   
    
    AKObjectManager *sharedManager = [self managerWithBaseURL: url];
    sharedManager.requestSerializationMIMEType = RKMIMETypeJSON;
    
    [sharedManager setupRequestDescriptors];
    [sharedManager setupResponseDescriptors];
    
    [sharedManager.HTTPClient setDefaultHeader:@"Authorization" value: [NSString stringWithFormat:@"token %@", PERSONAL_ACCESS_TOKEN]];
    
    return sharedManager;
    
    
}

-(void) setupRequestDescriptors{
    
}

-(void) setupResponseDescriptors{
    
}

@end
