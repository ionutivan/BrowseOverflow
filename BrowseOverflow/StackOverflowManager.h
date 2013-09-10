//
//  StackOverflowManager.h
//  BrowseOverflow
//
//  Created by Ionut Ivan on 7/12/13.
//  Copyright (c) 2013 Ionut Ivan. All rights reserved.
//

#import <Foundation/Foundation.h>
@class StackOverflowCommunicator;
@class Topic;
@class QuestionBuilder;

@protocol StackOverflowManagerDelegate;

@interface StackOverflowManager : NSObject

@property (nonatomic,weak) id<StackOverflowManagerDelegate> delegate;
@property (strong) StackOverflowCommunicator *communicator;
@property (strong) QuestionBuilder *questionBuilder;

- (void)fetchQuestionsOnTopic:(Topic *)topic;
- (void)searchingForQuestionsFailedWithError:(NSError *)error;
- (void)receivedQuestionsJSON:(NSString *)objectNotation;

@end

@protocol StackOverflowManagerDelegate <NSObject>

- (void)fetchingQuestionsFailedWithError:(NSError *)reportableError;
- (void)didReceiveQuestions:(NSArray *)questions;

@end
