//
//  Person.m
//  BrowseOverflow
//
//  Created by Ionut IVAN on 10/10/12.
//  Copyright (c) 2012 Ionut IVAN. All rights reserved.
//

#import "Person.h"

@implementation Person

@synthesize name;
@synthesize avatarURL;

- (id)initWithName:(NSString *)n avatarLocation:(NSString *)location {
    
    if (self = [super init])
    {
        name = [n copy];
        avatarURL = [[NSURL alloc] initWithString:location];
    }
    
    return self;
}

@end
