//
//  QuestionCreationTests.m
//  BrowseOverflow
//
//  Created by Ionut Ivan on 7/12/13.
//  Copyright (c) 2013 Ionut Ivan. All rights reserved.
//

#import "QuestionCreationTests.h"
#import "StackOverflowManager.h"
#import "Topic.h"
#import "StackOverflowCommunicator.h"
#import "QuestionBuilder.h"
#import "FakeQuestionBuilder.h"
#import "Question.h"

@interface MockStackOverflowManagerDelegate : NSObject <StackOverflowManagerDelegate>

@property (strong) NSError *fetchError;
@property (strong) NSArray *receivedQuestions;

@end

@implementation MockStackOverflowManagerDelegate

@synthesize fetchError;
@synthesize receivedQuestions;

- (void)fetchingQuestionsFailedWithError:(NSError *)error {
  self.fetchError = error;
}

- (void)didReceiveQuestions:(NSArray *)questions {
  self.receivedQuestions = questions;
}

@end

@interface MockStackOverflowCommunicator : StackOverflowCommunicator

- (BOOL)wasAskedToFetchQuestions;

@end

@implementation MockStackOverflowCommunicator
{
  BOOL wasAskedToFetchQuestions;
}

- (void)searchForQuestionsWithTag:(NSString *)tag {
  wasAskedToFetchQuestions = YES;
}

- (BOOL)wasAskedToFetchQuestions {
  return wasAskedToFetchQuestions;
}

@end

@implementation QuestionCreationTests
{
  @private
    StackOverflowManager *mgr;
    MockStackOverflowManagerDelegate *delegate;
    NSError *underlyingError;
    NSArray *questionArray;
    FakeQuestionBuilder *questionBuilder;
}

- (void)setUp {
  mgr = [[StackOverflowManager alloc] init];
  delegate = [[MockStackOverflowManagerDelegate alloc] init];
  mgr.delegate = delegate;
  underlyingError = [NSError errorWithDomain:@"Test domain"
                                        code:0
                                    userInfo:nil];
  Question *question = [[Question alloc] init];
  questionArray = [NSArray arrayWithObject:question];
  questionBuilder = [[FakeQuestionBuilder alloc] init];
}

- (void)tearDown {
  mgr = nil;
  mgr.delegate = nil;
  delegate = nil;
  underlyingError = nil;
  questionBuilder = nil;
}

- (void)testDelegateNotToldAboutErrorWhenQuestionReceived {
  mgr.questionBuilder = questionBuilder;
  questionBuilder.arrayToReturn = questionArray;
  [mgr receivedQuestionsJSON:@"Fake JSON"];
  STAssertNil([delegate fetchError], @"No error should be received on success");
}

- (void)testDelegateReceivesTheQuestionsDiscoveredByManager {
  questionBuilder.arrayToReturn = questionArray;
  mgr.questionBuilder = questionBuilder;
  [mgr receivedQuestionsJSON:@"Fake JSON"];
  STAssertEqualObjects([delegate receivedQuestions], questionArray, @"The manager should have sent its questions to the delegate");
}

- (void)testDelegateNotifiedOfErrorWhenQuestionBuilderFails {
  
  questionBuilder.arrayToReturn = nil;
  questionBuilder.errorToSet = underlyingError;
  mgr.questionBuilder = questionBuilder;
  [mgr receivedQuestionsJSON:@"Fake JSON"];
  STAssertNotNil([[[delegate fetchError] userInfo] objectForKey:NSUnderlyingErrorKey], @"The delegate should have found out about the error");
  mgr.questionBuilder = nil;
}

- (void)testNonConformingObjectsCannotBeDelegate {
  STAssertThrows(mgr.delegate = (id <StackOverflowManagerDelegate>)[NSNull null], @"NSNull should not be used as the delegate doesn't conform to the delegate protocol");
}

- (void)testConformingObjectCanBeDelegate {
  id <StackOverflowManagerDelegate> mockDelegate = [[MockStackOverflowManagerDelegate alloc] init];
  STAssertNoThrow(mgr.delegate = mockDelegate, @"Object conforming to the delegate protocol should be used as the delegate");
}

- (void)testManagerAcceptsNilAsADelegate {
  STAssertNoThrow(mgr.delegate = nil, @"It should be acceptable to use nil as an object's delegate");
}

- (void)testAskingForQuestionMeansRequestData {
  MockStackOverflowCommunicator *communicator = [[MockStackOverflowCommunicator alloc] init];
  mgr.communicator = communicator;
  Topic *topic = [[Topic alloc] initWithName:@"iPhone" tag:@"iphone"];
  [mgr fetchQuestionsOnTopic:topic];
  STAssertTrue([communicator wasAskedToFetchQuestions], @"The communicator should need to fetch data");
}

- (void)testErrorReturnedToDelegateIsNotErrorNotifiedByCommunicator {
  [mgr searchingForQuestionsFailedWithError:underlyingError];
  STAssertFalse(underlyingError == [delegate fetchError], @"Error should be at the correct level of abstraction");
}

- (void)testErrorReturnedToDelegateDocumentsUnderlyingError {
  [mgr searchingForQuestionsFailedWithError:underlyingError];
  STAssertEqualObjects([[[delegate fetchError] userInfo] objectForKey:NSUnderlyingErrorKey], underlyingError, @"The underlying error should be available to client code");
}

- (void)testQuestionJSONIsPassedToQuestionBuilder {
  
  mgr.questionBuilder = questionBuilder;
  [mgr receivedQuestionsJSON:@"Fake JSON"];
  STAssertEqualObjects(questionBuilder.JSON, @"Fake JSON", @"Download JSON is sent to the builder");
  mgr.questionBuilder = nil;
}

@end
