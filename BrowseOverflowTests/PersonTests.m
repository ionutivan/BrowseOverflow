//
//  PersonTests.m
//  BrowseOverflow
//
//  Created by Ionut Ivan on 7/10/13.
//  Copyright (c) 2013 Ionut Ivan. All rights reserved.
//

#import "PersonTests.h"
#import "Person.h"

@implementation PersonTests

- (void)setUp
{
  person = [[Person alloc] initWithName:@"Graham Lee" avatarLocation:@"http://example.com/avatar.jpg"];
}

- (void)testThatPersonHasAName {
  STAssertEqualObjects(person.name, @"Graham Lee", @"expecting a person to provide its name");
}

- (void)testThatPersonHasAnAvatarURL {
  STAssertEqualObjects([person.avatarURL absoluteString], @"http://example.com/avatar.jpg", @"the person's avatar should be represented by a URL");
}

- (void)tearDown
{
  person = nil;
}

@end
