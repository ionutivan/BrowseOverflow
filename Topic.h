//
//  Topic.h
//  BrowseOverflow
//
//  Created by Ionut IVAN on 10/10/12.
//  Copyright (c) 2012 Ionut IVAN. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Question;

@interface Topic : NSObject
{
    NSArray *questions;
}

@property (strong,readonly) NSString *name;
@property (readonly) NSString *tag;

- (id)initWithName:(NSString *)n tag:(NSString *)t;
- (NSArray *)recentQuestions;
- (void)addQuestion:(Question *)q;

@end
