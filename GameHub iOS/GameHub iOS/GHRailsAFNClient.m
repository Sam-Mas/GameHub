//
//  GHRailsAFNClient.m
//  GameHub iOS
//
//  Created by Dave Laszczak on 2015-03-13.
//  Copyright (c) 2015 Dave Laszczak. All rights reserved.
//

#import "GHRailsAFNClient.h"

@implementation GHRailsAFNClient

-(void) getAllChallengers{
    
    NSURL *url = [NSURL URLWithString:@"localhost:3000/api/v1/challengers"];
    
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:
                            _challengerID.text, @"id",
                            _challengerName.text, @"name",
                            _challengerBalance.text, @"balance", nil];
    
    GHRailsAFNClient *httpClient = [[GHRailsAFNClient alloc] initWithBaseURL:url];
    
    NSString *endURL = [NSString stringWithFormat:@"/api/v1/challengers?auth_token=%@", [[User sharedInstance] token]];
    
    NSData *imageData = UIImageJPEGRepresentation(_challenger, 1.0);
    NSURLRequest *request = [httpClient multipartFormRequestWithMethod:@"POST" path:endURL parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        [formData appendPartWithFileData:challengerData name:@"image" fileName:@"image.jpg" mimeType:@"image/jpg"];
    }];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        NSLog(@"%@", JSON);
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        NSLog(@"Error creating photo!");
        NSLog(@"%@", error);
    }];
    
    [operation start];
    
    
    
    
}



//+(instancetype)sharedClient
//{

//    static GHRailsAFNClient *_sharedClient = nil;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        
//        //create a client
//        NSURL *baseURL = [NSURL URLWithString:ROOT_URL];
//        _sharedClient = [[GHRailsAFNClient alloc] initWithBaseURL:baseURL];
//        
//        //set the client header fields
//        if ([GHUserSession userID])
//            [_sharedClient.requestSerializer setValue:[GHUserSession userID] forHTTPHeaderField:@"X-DEVICE-TOKEN"];
//        else
//            [_sharedClient.requestSerializer setValue:HUMAppSecret forHTTPHeaderField:@"X-APP-SECRET"];
//        
//    });
//    
//    return _sharedClient;
//    
    
//}


@end
