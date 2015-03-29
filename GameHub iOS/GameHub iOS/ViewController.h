//
//  ViewController.h
//  GameHub iOS
//
//  Created by Dave Laszczak on 2015-03-03.
//  Copyright (c) 2015 Dave Laszczak. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoggedInViewController.h"
#import "Challenger.h"


@class LoggedInViewController;

@interface ViewController : UIViewController

extern Challenger *currentChallenger;

//@property(strong,nonatomic)LoggedInViewController *loggedInViewController;
@property(strong,nonatomic)Challenger *loggedInChallenger;
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;


@end



