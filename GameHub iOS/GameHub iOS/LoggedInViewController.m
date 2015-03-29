//
//  LoggedInViewController.m
//  GameHub iOS
//
//  Created by Dave Laszczak on 2015-03-16.
//  Copyright (c) 2015 Dave Laszczak. All rights reserved.
//

#import "LoggedInViewController.h"

@interface LoggedInViewController ()


@end


@implementation LoggedInViewController

@synthesize usernameLabel;
@synthesize balanceLabel;
//@synthesize challenger;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    
    NSLog(@"-=-=--=Challenger naem is : %@ ", self.challenger.name);
    usernameLabel.text  = self.challenger.name;//self.challenger.name;
    
//    NSNumber balance    = self.challenger.balance;
    balanceLabel.text   = self.challenger.balance.stringValue;
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

-(void) doWork{
    
     NSLog(@"-=-=--=Challenger naem is : %@ ", self.challenger.name);
//
//    NSString *name = self.challenger.name;
//    self.usernameLabel.text = name;
    usernameLabel.text = @"TestTEst";
    [self viewDidLoad];
//    [self.usernameLabel setNeedsDisplay];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
