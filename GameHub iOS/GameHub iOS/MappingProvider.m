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

+(RKObjectMapping * )challengerMapping {
    RKObjectMapping *mapping = [ RKObjectMapping mappingForClass:[Challenger class]];
    NSDictionary *mappingDictionary = @{
                                        @"id": @"challengerId",
                                        @"name": @"name",
                                        @"balance": @"balance"
                                        };
    
    [mapping addAttributeMappingsFromDictionary:mappingDictionary];
    
    
    return mapping;
}
@end
