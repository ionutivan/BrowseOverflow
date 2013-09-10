//
//  FakeQuestionBuilder.h
//  BrowseOverflow
//
//  Created by Ionut Ivan on 7/16/13.
//  Copyright (c) 2013 Ionut Ivan. All rights reserved.
//

#import "QuestionBuilder.h"

@class Question;

@interface FakeQuestionBuilder : QuestionBuilder

@property (copy) NSString *JSON;
@property (copy) NSArray *arrayToReturn;
@property (copy) NSError *errorToSet;

@end