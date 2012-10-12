//
//  Answer.m
//  BrowseOverflow
//
//  Created by Ionut IVAN on 10/11/12.
//  Copyright (c) 2012 Ionut IVAN. All rights reserved.
//

#import "Answer.h"
#import "Person.h"

@implementation Answer

@synthesize text;
@synthesize person;
@synthesize accepted;
@synthesize score;

- (NSComparisonResult)compare:(Answer *)otherAnswer
{
    if (accepted && !(otherAnswer.accepted)) {
        return NSOrderedAscending;
    } else if (!accepted && otherAnswer.accepted) {
        return NSOrderedDescending;
    }
    
    if (score > otherAnswer.score) {
        return NSOrderedAscending;
    } else if (score < otherAnswer.score) {
        return NSOrderedDescending;
    } else {
        return NSOrderedSame;
    }
}

@end
