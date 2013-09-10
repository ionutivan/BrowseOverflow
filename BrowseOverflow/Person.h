//
//  Person.h
//  BrowseOverflow
//
//  Created by Ionut Ivan on 7/10/13.
//  Copyright (c) 2013 Ionut Ivan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSURL *avatarURL;
- (id)initWithName:(NSString *)name avatarLocation:(NSString *)avatarLocation;

@end
