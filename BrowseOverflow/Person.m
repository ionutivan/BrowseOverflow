//
//  Person.m
//  BrowseOverflow
//
//  Created by Ionut Ivan on 7/10/13.
//  Copyright (c) 2013 Ionut Ivan. All rights reserved.
//

#import "Person.h"

@implementation Person

- (id)initWithName:(NSString *)name avatarLocation:(NSString *)avatarLocation
{
  if ((self = [super init])) {
    _name = [name copy];
    _avatarURL = [[NSURL URLWithString:avatarLocation] copy];
  }
  
  return self;
}

@end
