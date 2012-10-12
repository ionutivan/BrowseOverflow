//
//  Answer.h
//  BrowseOverflow
//
//  Created by Ionut IVAN on 10/11/12.
//  Copyright (c) 2012 Ionut IVAN. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Person;

@interface Answer : NSObject

@property NSString *text;
@property Person *person;
@property (getter = isAccepted) BOOL accepted;
@property NSUInteger score;

- (NSComparisonResult)compare:(Answer *)otherAnswer;

@end
