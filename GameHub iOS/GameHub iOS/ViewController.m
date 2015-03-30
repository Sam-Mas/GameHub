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

@synthesize usernameTextField;
@synthesize loggedInChallenger;

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
}

- (IBAction)loginChallenger:(id)sender {

    NSString * username = usernameTextField.text;
    
    NSDictionary *name = @{
                           @"name": username,
                           
                           };
    [[ChallengerManager sharedManager] loadUser :name :^(Challenger *challenger)
    {
            NSLog(@"************user is: %@ *************", challenger.name);
            [self performSegueWithIdentifier: @"loggedInSegue" sender: challenger];
        }
        failure:^(RKObjectRequestOperation *operation, NSError *error) {
            NSLog(@"Could not login :  %@", error);
        }
    ];

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier] isEqualToString:@"loggedInSegue"])
    {
        // Get reference to the destination view controller
        LoggedInViewController *vc = [segue destinationViewController];

        Challenger *ch1 = (Challenger *) sender;
        
        // Pass any objects to the view controller here, like...
        [vc setChallenger:ch1];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
