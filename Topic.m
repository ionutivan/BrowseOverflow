//
//  Topic.m
//  BrowseOverflow
//
//  Created by Ionut IVAN on 10/10/12.
//  Copyright (c) 2012 Ionut IVAN. All rights reserved.
//

#import "Topic.h"
#import "Question.h"

@implementation Topic

@synthesize name;
@synthesize tag;

- (id)initWithName:(NSString *)n tag:(NSString *)t
{
    if (self = [super init]) {
        name = [n copy];
        tag = [t copy];
        questions = [[NSArray alloc] init];
    }
    
    return self;
}

- (NSArray *)recentQuestions
{
    return [self sortQuestionsLatestFirst:questions];
}

- (NSArray *)sortQuestionsLatestFirst:(NSArray *)questionList
{
    NSArray *sortedQuestions = [questionList sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        Question *q1 = (Question *)obj1;
        Question *q2 = (Question *)obj2;
        return [q2.date compare:q1.date];
    }];
    
    return sortedQuestions;
}

- (void)addQuestion:(Question *)q
{
    NSArray *myQuestions = [questions arrayByAddingObject:q];
    if ([myQuestions count] > 20) {
        myQuestions = [self sortQuestionsLatestFirst:myQuestions];
        myQuestions = [myQuestions subarrayWithRange:NSMakeRange(0, 20)];
    }
    questions = myQuestions;
}



@end
