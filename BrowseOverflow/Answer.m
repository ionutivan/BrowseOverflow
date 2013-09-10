//
//  Answer.m
//  BrowseOverflow
//
//  Created by Ionut Ivan on 7/12/13.
//  Copyright (c) 2013 Ionut Ivan. All rights reserved.
//

#import "Answer.h"

@implementation Answer

- (NSComparisonResult)compare:(Answer *)otherAnswer
{
  if (_accepted && !(otherAnswer.accepted)) {
    return NSOrderedAscending;
  } else if (!_accepted && otherAnswer.accepted) {
    return NSOrderedDescending;
  }
  
  if (_score > otherAnswer.score) {
    return NSOrderedAscending;
  } else if (_score < otherAnswer.score) {
    return NSOrderedDescending;
  } else {
    return NSOrderedSame;
  }
}

@end
