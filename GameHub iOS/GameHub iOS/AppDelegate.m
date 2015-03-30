//
//  AppDelegate.m
//  GameHub iOS
//
//  Created by Dave Laszczak on 2015-03-03.
//  Copyright (c) 2015 Dave Laszczak. All rights reserved.
//

#import "AppDelegate.h"
#import "NSRConfig.h"
#import "MMDrawerController.h"

#import "MMCenterTableViewController.h"
#import "MMRightSideDrawerViewController.h"
#import "MMLeftSideDrawerViewController.h"

#import "MMDrawerVisualStateManager.h"
#import "MMNavigationController.h"

#import "ViewController.h"

@interface AppDelegate ()
@property (nonatomic,strong) MMDrawerController * drawerController;

@end


@implementation AppDelegate



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIStoryboard * storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *centerViewController = [storyboard instantiateInitialViewController];
    UIViewController * rightSideDrawerViewController = [[MMRightSideDrawerViewController alloc] init];
    
    UINavigationController * navigationController = [[MMNavigationController alloc] initWithRootViewController:centerViewController];
    [navigationController setRestorationIdentifier:@"MMCenterNavigationControllerRestorationKey"];
    self.drawerController = [[MMDrawerController alloc]
                                 initWithCenterViewController:navigationController
                                 rightDrawerViewController:rightSideDrawerViewController];

    [self.drawerController setRestorationIdentifier:@"MMDrawer"];
    [self.drawerController setMaximumRightDrawerWidth:200.0];
    [self.drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
    [self.drawerController setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
    
    [self.drawerController
     setDrawerVisualStateBlock:^(MMDrawerController *drawerController, MMDrawerSide drawerSide, CGFloat percentVisible) {
         MMDrawerControllerDrawerVisualStateBlock block;
         block = [[MMDrawerVisualStateManager sharedManager]
                  drawerVisualStateBlockForDrawerSide:drawerSide];
         if(block){
             block(drawerController, drawerSide, percentVisible);
         }
     }];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window setRootViewController:self.drawerController];
    
    

    
// http://localhost:3000/api/v1/challengers   
    
     [[NSRConfig defaultConfig] setRootURL:[NSURL URLWithString:@"http://localhost:3000/"]];
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
