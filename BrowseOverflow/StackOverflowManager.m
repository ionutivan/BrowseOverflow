//
//  StackOverflowManager.m
//  BrowseOverflow
//
//  Created by Ionut Ivan on 7/12/13.
//  Copyright (c) 2013 Ionut Ivan. All rights reserved.
//

#import "StackOverflowManager.h"
#import "Topic.h"
#import "StackOverflowCommunicator.h"
#import "QuestionBuilder.h"

extern NSString *StackOverflowManagerError;
extern NSString *StackOverflowManagerSearchFailedError;
enum {
  StackOverflowManagerErrorQuestionSearchCode
};

@implementation StackOverflowManager

- (void)setDelegate:(id<StackOverflowManagerDelegate>)delegate {
  if (delegate && ![delegate conformsToProtocol:@protocol(StackOverflowManagerDelegate)]) {
    [[NSException exceptionWithName:NSInvalidArgumentException
                            reason:@"Delegate object does not conform to the delegate protocol"
                           userInfo:nil] raise];
  }
  
  _delegate = delegate;
}

- (void)fetchQuestionsOnTopic:(Topic *)topic
{
  [_communicator searchForQuestionsWithTag:[topic tag]];
}

- (void)searchingForQuestionsFailedWithError:(NSError *)error {
  NSDictionary *errorInfo = @{NSUnderlyingErrorKey:error};
  [self tellDelegateAboutQuestionSearchWithErrorInfo:errorInfo];
}

- (void)receivedQuestionsJSON:(NSString *)objectNotation {
  NSError *error = nil;
  NSArray *questions = [_questionBuilder questionsFromJSON:objectNotation error:&error];
  if (!questions) {
    NSDictionary *errorInfo = nil;
    if (error) {
      errorInfo = @{NSUnderlyingErrorKey:error};
    }
    [self tellDelegateAboutQuestionSearchWithErrorInfo:errorInfo];
  } else {
    [_delegate didReceiveQuestions:questions];
  }
}

- (void)tellDelegateAboutQuestionSearchWithErrorInfo:(NSDictionary *)errorInfo {
  NSError *reportableError = [NSError errorWithDomain:StackOverflowManagerSearchFailedError
                                                 code:StackOverflowManagerErrorQuestionSearchCode
                                             userInfo:errorInfo];
  [_delegate fetchingQuestionsFailedWithError:reportableError];
}

@end

NSString *StackOverflowManagerError = @"StackOverflowManagerError";
NSString *StackOverflowManagerSearchFailedError = @"StackOverflowManagerSearchFailedError";
