//
//  GameHub_iOSTests.m
//  GameHub iOSTests
//
//  Created by Dave Laszczak on 2015-03-03.
//  Copyright (c) 2015 Dave Laszczak. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "Challenger.h"

@interface GameHub_iOSTests : XCTestCase

@end

@implementation GameHub_iOSTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testChallengerCreation {
    Challenger *challenger = [Challenger new];
    XCTAssertNotNil(challenger, @"Challenger not nil");
    
    NSNumber * challengerId = @123;
    NSString * name = @"Bob";
    NSNumber * balance = @500;
    NSString * created_at = @"2015/03/30 08:00:00";
    NSString * updated_at = @"2015/03/30 10:00:00";
    NSNumber * gameId = @3;
    NSString * opponentName = @"Sally";
    NSNumber * token = @1;
    
    challenger.challengerId = challengerId;
    challenger.name = name;
    challenger.balance = balance;
    challenger.created_at = created_at;
    challenger.updated_at = updated_at;
    challenger.coin_game_id = gameId;
    challenger.opponent = opponentName;
    challenger.token = token;
    
    XCTAssertEqual(challenger.challengerId, challengerId);
    XCTAssertEqual(challenger.name, name);
    XCTAssertEqual(challenger.balance, balance);
    XCTAssertEqual(challenger.created_at, created_at);
    XCTAssertEqual(challenger.updated_at, updated_at);
    XCTAssertEqual(challenger.coin_game_id, gameId);
    XCTAssertEqual(challenger.opponent, opponentName);
    XCTAssertEqual(challenger.token, token);
}

@end
