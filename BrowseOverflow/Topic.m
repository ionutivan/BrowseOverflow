//
//  Topic.m
//  BrowseOverflow
//
//  Created by Ionut Ivan on 7/10/13.
//  Copyright (c) 2013 Ionut Ivan. All rights reserved.
//

#import "Topic.h"
#import "Question.h"

@implementation Topic

- (id)initWithName:(NSString *)name tag:(NSString *)tag
{
  if ((self = [super init])) {
    _name = [name copy];
    _tag = [tag copy];
    questions = [[NSArray alloc] init];
  }
  
  return self;
}

- (void)addQuestion: (Question *)question
{
  //questions = [questions arrayByAddingObject:question];
  NSArray *newQuestions = [questions arrayByAddingObject:question];
  if ([newQuestions count]>20) {
    newQuestions = [self sortQuestionsLatest:newQuestions];
    newQuestions = [newQuestions subarrayWithRange:NSMakeRange(0, 20)];
  }
  questions = newQuestions;
}

- (NSArray *)sortQuestionsLatest:(NSArray *)questionList {
  return [questionList sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
    Question *q1 = (Question *)obj1;
    Question *q2 = (Question *)obj2;
    return [q2.date compare:q1.date];
  }];
}

- (NSArray *)recentQuestions
{
  return [self sortQuestionsLatest:questions];
}

@end
