//
//  MockStackOverflowManagerDelegate.m
//  BrowseOverflow
//
//  Created by Ionut IVAN on 10/11/12.
//  Copyright (c) 2012 Ionut IVAN. All rights reserved.
//

#import "MockStackOverflowManagerDelegate.h"


@implementation MockStackOverflowManagerDelegate

@synthesize fetchError;

- (void)fetchingQuestionsOnTopic:(Topic *)topic failedWithError:(NSError *)error
{
    self.fetchError = error;
}

@end
