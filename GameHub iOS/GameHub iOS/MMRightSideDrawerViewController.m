// Copyright (c) 2013 Mutual Mobile (http://mutualmobile.com/)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.


#import "MMRightSideDrawerViewController.h"
#import "ChallengerManager.h"
#import "Challenger.h"

@interface MMRightSideDrawerViewController ()

@end

@implementation MMRightSideDrawerViewController


-(id)init{
    self = [super init];
    if(self){
        [self setRestorationIdentifier:@"MMRightSideDrawerController"];
    }
    [[ChallengerManager sharedManager] loadAllChallengers:^(NSArray *challengerList){
        NSLog(@"************Challenger count fetched: %u *************", challengerList.count);
        self.challengers = challengerList;
        
    }
                                                  failure:^(RKObjectRequestOperation *operation, NSError *error) {
                                                      NSLog(@"* ****   ****   *****  **error occured: %@", error);
                                                  }];
    
    return self;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
    NSLog(@"Right will appear");
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"Right did appear");
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    NSLog(@"Right will disappear");
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    NSLog(@"Right did disappear");
}

-(void)viewDidLoad{
    [super viewDidLoad];
    [self setTitle:@"Challengers"];
}

-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [super tableView:tableView titleForHeaderInSection:section];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
    if (indexPath.row < self.challengers.count) {
        [cell.textLabel setText:((Challenger *)self.challengers[indexPath.row]).name];
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == MMDrawerSectionDrawerWidth){
        [self.mm_drawerController
         setMaximumRightDrawerWidth:[self.drawerWidths[indexPath.row] floatValue]
         animated:YES
         completion:^(BOOL finished) {
             [tableView reloadSections:[NSIndexSet indexSetWithIndex:indexPath.section] withRowAnimation:UITableViewRowAnimationNone];
             [tableView selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
             [tableView deselectRowAtIndexPath:indexPath animated:YES];
         }];
    }
    else {
        [super tableView:tableView didSelectRowAtIndexPath:indexPath];
    }
}

@end
