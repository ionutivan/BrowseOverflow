//
//  MockStackOverflowCommunicator.m
//  BrowseOverflow
//
//  Created by Ionut IVAN on 10/11/12.
//  Copyright (c) 2012 Ionut IVAN. All rights reserved.
//

#import "MockStackOverflowCommunicator.h"
#import "StackOverflowCommunicator.h"

@implementation MockStackOverflowCommunicator
{
    BOOL wasAkedToFetchQuestions;
}

- (void)searchForQuestionsWithTag:(NSString *)tag {
    wasAkedToFetchQuestions = YES;
}

- (BOOL)wasAskedToFetchQuestions
{
    return wasAkedToFetchQuestions;
}


@end
