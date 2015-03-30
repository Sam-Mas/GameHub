//
//  basicFunctionsTest.m
//  GameHub iOS
//
//  Created by Dave Laszczak on 2015-03-30.
//  Copyright (c) 2015 Dave Laszczak. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "ViewController.h"
#import "LoggedInViewController.h"
#import <OCMock/OCMock.h>

@interface basicFunctionsTest : XCTestCase

@end

@implementation basicFunctionsTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

-(void)testLoginView{
    
//    app = [NSApplication sharedApplication];
    
//    app = [UIApplication sharedApplication];
//
//    loginViewController = (ViewController*)[[UIApplication sharedApplication] delegate];
//    calcView             = calcViewController.view;
//    
//    XCTAssertNotNil(calcView, @"Cannot find CalcView instance");
    
    
//    ViewController *viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
//    [viewController loadView]; //It is not strictly necessary to call loadView for this test as we access the view property which will call loadView if view is nil
//    assertThat(viewController.view, isNot(nil));
//    assertThat(viewController.button, isNot(nil));
    
}

- (void)test_viewDidLoad_viewController {
    
//    ViewController *viewContoller = [[ViewController alloc] init];
//    ViewController *viewContoller = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
////     LoggedInViewController *viewContoller = [LoggedInViewController alloc];
//    
//    id mock = [OCMockObject partialMockForObject:viewContoller];
//    [[mock expect] viewDidLoad];
//    
//    [UIApplication sharedApplication].keyWindow.rootViewController = (ViewController *)mock;
//    
//    [mock verify];
}


- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
