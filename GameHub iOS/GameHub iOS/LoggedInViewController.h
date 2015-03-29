//
//  LoggedInViewController.h
//  GameHub iOS
//
//  Created by Dave Laszczak on 2015-03-16.
//  Copyright (c) 2015 Dave Laszczak. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Challenger.h"

@interface LoggedInViewController : UIViewController
@property (nonatomic, retain) Challenger *challenger;
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *balanceLabel;

-(void) doWork;

@end
