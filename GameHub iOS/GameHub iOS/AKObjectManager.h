//
//  AKObjectManager.h
//  GameHub iOS
//
//  Created by Dave Laszczak on 2015-03-13.
//  Copyright (c) 2015 Dave Laszczak. All rights reserved.
//

#import "RKObjectManager.h"

@interface AKObjectManager : RKObjectManager

+(instancetype) sharedManager;

-(void) setupRequestDescriptors;
-(void) setupResponseDescriptors;

@end
