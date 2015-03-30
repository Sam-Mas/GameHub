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

    
    [challengerMapping addAttributeMappingsFromDictionary:@{
      @"id":            @"challengerId",
      @"name":          @"name",
      @"balance":       @"balance",
      @"created_at":    @"created_at",
      @"updated_at":    @"updated_at",
      @"coin_game_id":  @"coin_game_id",
      @"opponent":      @"opponent",
      @"token":         @"token"
      }];
    
    
        
    return challengerMapping;
}
@end
