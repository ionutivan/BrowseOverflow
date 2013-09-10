//
//  QuestionBuilder.h
//  BrowseOverflow
//
//  Created by Ionut Ivan on 7/16/13.
//  Copyright (c) 2013 Ionut Ivan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuestionBuilder : NSObject

- (NSArray *)questionsFromJSON:(NSString *)objectNotation
                         error:(NSError **)error;

@end
