//
//  QuestionTests.h
//  BrowseOverflow
//
//  Created by Ionut Ivan on 7/10/13.
//  Copyright (c) 2013 Ionut Ivan. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
@class Question;
@class Answer;

@interface QuestionTests : SenTestCase
{
  Question *question;
  Answer *lowScore;
  Answer *highScore;
}

@end
