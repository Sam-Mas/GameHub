//
//  MappingProvider.m
//  GameHub iOS
//
//  Created by Dave Laszczak on 2015-03-13.
//  Copyright (c) 2015 Dave Laszczak. All rights reserved.
//

#import "MappingProvider.h"

#import <RestKit/RestKit.h>
#import "ChallengerManager.h"
#import "Challenger.h"


@implementation MappingProvider

+(RKObjectMapping * )getChallengerMapping {
    RKObjectMapping *challengerMapping = [ RKObjectMapping mappingForClass:[Challenger class]];
//    NSDictionary *mappingDictionary = @{
//                                        @"id": @"challengerId",
//                                        @"name": @"name",
//                                        @"balance": @"balance"
//                                        };
//    
//    [challengerMapping addAttributeMappingsFromDictionary:mappingDictionary];

    
    [challengerMapping addAttributeMappingsFromDictionary:@{
      @"id":            @"challengerId",
      @"name":          @"name",
      @"balance":       @"balance",
//      @"turn_taken":    @"turn_taken",
      @"created_at":    @"created_at",
      @"updated_at":    @"updated_at",
      @"coin_game_id":  @"coin_game_id",
      @"opponent":      @"opponent",
      @"token":         @"token"
    
      }];
    
    
        
    return challengerMapping;
}
@end
