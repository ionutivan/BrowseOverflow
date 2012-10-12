//
//  Question.h
//  BrowseOverflow
//
//  Created by Ionut IVAN on 10/10/12.
//  Copyright (c) 2012 Ionut IVAN. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Answer;

@interface Question : NSObject
{
    NSMutableSet *answerSet;
}

@property (strong) NSDate *date;
@property (strong) NSString *title;
@property NSInteger score;
@property (readonly) NSArray *answers;

- (void)addAnswer:(Answer *)answer;

@end
