//
//  ViewController.m
//  GameHub iOS
//
//  Created by Dave Laszczak on 2015-03-03.
//  Copyright (c) 2015 Dave Laszczak. All rights reserved.
//

#import "ViewController.h"
#import "ChallengerManager.h"
#import "Challenger.h"





@interface ViewController ()

@end

@implementation ViewController

- (id)init
{
    self = [super init];
    if (self) {
        [self setRestorationIdentifier:@"MMCenterControllerRestorationKey"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    
//    [[ChallengerManager sharedManager] loadAuthenticatedChallenger:^(Challenger *challenger){
//        NSLog(@"************user is: %@ *************", challenger.name);
//    }
//    failure:^(RKObjectRequestOperation *operation, NSError *error) {
//         NSLog(@"* ****   ****   *****  **error occured: %@", error);
//     }];
    
}

- (IBAction)loginChallenger:(id)sender {


    
    NSDictionary *name = @{
                            @"name": @"Dave",
                            
                        };
    
    
    [[ChallengerManager sharedManager] loadUser :name :^(Challenger *challenger){
                 NSLog(@"************user is: %@ *************", challenger.name);
        }

        failure:^(RKObjectRequestOperation *operation, NSError *error) {
            NSLog(@"We Fucked Up %@", error);
        }
    ];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
