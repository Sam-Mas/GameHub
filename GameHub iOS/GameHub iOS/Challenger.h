//
//  Challenger.h
//  GameHub iOS
//
//  Created by Dave Laszczak on 2015-03-11.
//  Copyright (c) 2015 Dave Laszczak. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "NSRails.h"

@interface Challenger : NSObject

@property (nonatomic,strong) NSNumber *challengerId;
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSNumber *balance;
//@property (assign) BOOL *turn_taken;
@property (nonatomic,strong) NSString *created_at;
@property (nonatomic,strong) NSString *updated_at;
@property (nonatomic,strong) NSNumber *coin_game_id;
@property (nonatomic,strong) NSString *opponent;
@property (nonatomic,strong) NSNumber *token;



@end
