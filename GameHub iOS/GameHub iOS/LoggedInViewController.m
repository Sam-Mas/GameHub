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

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    return self;
}

- (void)viewDidLoad {
    
    NSLog(@"-=-=--=Challenger name is : %@ ", self.challenger.name);
    usernameLabel.text  = self.challenger.name;
    
    balanceLabel.text   = self.challenger.balance.stringValue;
    
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
