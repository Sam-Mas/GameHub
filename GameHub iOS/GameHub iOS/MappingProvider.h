//
//  MappingProvider.h
//  GameHub iOS
//
//  Created by Dave Laszczak on 2015-03-13.
//  Copyright (c) 2015 Dave Laszczak. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RKObjectMapping;

@interface MappingProvider : NSObject

+(RKObjectMapping *) getChallengerMapping;

@end
