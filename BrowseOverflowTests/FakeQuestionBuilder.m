//
//  FakeQuestionBuilder.m
//  BrowseOverflow
//
//  Created by Ionut Ivan on 7/16/13.
//  Copyright (c) 2013 Ionut Ivan. All rights reserved.
//

#import "FakeQuestionBuilder.h"
#import "Question.h"

@implementation FakeQuestionBuilder

- (NSArray *)questionsFromJSON:(NSString *)objectNotation
                         error:(NSError **)error {
  self.JSON = objectNotation;
  *error = self.errorToSet;
  return _arrayToReturn;
}

@end
