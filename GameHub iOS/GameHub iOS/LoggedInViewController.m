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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
}

-(void) doWork{
    UILabel *myLabel  =  [[UILabel alloc]init];
    myLabel.frame     =  CGRectMake(50,100,100,20);

     NSLog(@"-=-=--=Challenger naem is : %@ ", self.challenger.name);

    
//    myLabel.text      =  self.challenger.name;
    
     myLabel.text      =  [NSString stringWithFormat:@"Challenger Name : %@", _challenger];
    
    [self.view addSubview:myLabel];

    
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
