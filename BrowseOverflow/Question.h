//
//  Question.h
//  BrowseOverflow
//
//  Created by Ionut Ivan on 7/10/13.
//  Copyright (c) 2013 Ionut Ivan. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Answer;

@interface Question : NSObject
{
  NSMutableSet *answerSet;
}

@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) NSString *title;
@property (nonatomic) int score;
@property (nonatomic, readonly) NSArray *answers;

- (void)addAnswer:(Answer *)answer;

@end
