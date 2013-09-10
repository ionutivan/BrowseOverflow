//
//  StackOverflowManager.h
//  BrowseOverflow
//
//  Created by Ionut IVAN on 10/11/12.
//  Copyright (c) 2012 Ionut IVAN. All rights reserved.
//

#import <Foundation/Foundation.h>
@class StackOverflowCommunicator;
@class Topic;

@protocol StackOverflowManagerDelegate;

@interface StackOverflowManager : NSObject

@property (weak,nonatomic) id<StackOverflowManagerDelegate> delegate;
@property (strong) StackOverflowCommunicator *communicator;

- (void)fetchQuestionsOnTopic:(Topic *)topic;

@end

@protocol StackOverflowManagerDelegate <NSObject>

@end

