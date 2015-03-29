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
//        currentChallenger = challenger;
        
        
        
        //[loggedInViewController performSegueWithIdentifier:@"loggedInSegue" sender:self];
         [self performSegueWithIdentifier: @"loggedInSegue" sender: challenger];
        
        
        //             UIStoryboard *storyboard = self.storyboard;
        //             MyViewController *controller = [storyboard
        //            instantiateViewControllerWithIdentifier:@"myControllerIdentifier"];
        //             [self.navigationController pushViewController:controller animated:YES];
        }
        failure:^(RKObjectRequestOperation *operation, NSError *error) {
            NSLog(@"Could not login :  %@", error);
        }
    ];

}


//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
//    
//    if([segue.identifier isEqualToString:@"loggedInSegue"]){
//        LoggedInViewController *controller = (LoggedInViewController *)segue.destinationViewController;
//        controller.challenger = YES;
//    }
//
//}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier] isEqualToString:@"loggedInSegue"])
    {
        // Get reference to the destination view controller
        LoggedInViewController *vc = [segue destinationViewController];
        
//      Challenger *challenger1  = [(Challenger *) sender];
        
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
