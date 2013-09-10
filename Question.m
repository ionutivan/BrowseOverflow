//
//  Question.m
//  BrowseOverflow
//
//  Created by Ionut IVAN on 10/10/12.
//  Copyright (c) 2012 Ionut IVAN. All rights reserved.
//

#import "Question.h"
#import "Answer.h"

@implementation Question

@synthesize date;
@synthesize title;
@synthesize score;
@synthesize answers;

- (id)init
{
    if (self = [super init]) {
        answerSet = [[NSMutableSet alloc] init];
    }
    
    return self;
}

- (void)addAnswer:(Answer *)answer
{
    [answerSet addObject:answer];
}

- (NSArray *)answers
{
    return [[answerSet allObjects] sortedArrayUsingSelector:@selector(compare:)];
}

@end
