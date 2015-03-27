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
    
}

- (IBAction)loginChallenger:(id)sender {

    NSString * username = usernameTextField.text;
    
    NSDictionary *name = @{
                           @"name": username,
                           
                           };

    
    
    [[ChallengerManager sharedManager] loadUser :name :^(Challenger *challenger)
    {
//        NSLog(@"************user is: %@ *************", challenger.name);
//        
//        LoggedInViewController *loggedInViewController = [LoggedInViewController alloc] ;
//                                                           //]initWithNibName:@"LoggedInViewController" bundle:nil];
//        
//        loggedInViewController.challenger = challenger;
//        
//        [loggedInViewController doWork];
//        
////        [self presentViewController:self.loggedInViewController animated:YES completion:nil];
        
        
        }
        failure:^(RKObjectRequestOperation *operation, NSError *error) {
            NSLog(@"Could not login :  %@", error);
        }
    ];

}

-(void)passDataForward
{
    
    
}

//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
//    if([segue.identifier isEqualToString:@"pushChallenger"]){
//        LoggedInViewController *controller = (LoggedInViewController *)segue.destinationViewController;
//        controller.challenger = YES;
//    }
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
