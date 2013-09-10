//
//  Question.m
//  BrowseOverflow
//
//  Created by Ionut Ivan on 7/10/13.
//  Copyright (c) 2013 Ionut Ivan. All rights reserved.
//

#import "Question.h"

@implementation Question

- (id)init {
  if ((self = [super init])) {
    answerSet = [[NSMutableSet alloc] init];
  }
  
  return self;
}

- (void)addAnswer:(Answer *)answer {
  [answerSet addObject:answer];
}

- (NSArray *)answers {
  return [[answerSet allObjects] sortedArrayUsingSelector:@selector(compare:)];
}

@end
