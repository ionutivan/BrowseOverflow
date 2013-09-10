//
//  Topic.h
//  BrowseOverflow
//
//  Created by Ionut Ivan on 7/10/13.
//  Copyright (c) 2013 Ionut Ivan. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Question;

@interface Topic : NSObject
{
  NSArray *questions;
}

@property (readonly) NSString *name;
@property (readonly) NSString *tag;

- (id)initWithName:(NSString *)name tag:(NSString *)tag;
- (NSArray *)recentQuestions;
- (void)addQuestion: (Question *)question;

@end
