//
//  Answer.h
//  BrowseOverflow
//
//  Created by Ionut Ivan on 7/12/13.
//  Copyright (c) 2013 Ionut Ivan. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Person;

@interface Answer : NSObject

@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) Person *person;
@property (nonatomic) NSUInteger score;
@property (nonatomic, getter = isAccepted) BOOL accepted;

- (NSComparisonResult)compare:(Answer *)ans;

@end
