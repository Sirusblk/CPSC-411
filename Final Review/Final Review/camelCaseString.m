//
//  camelCaseString.m
//  Final Review
//
//  Created by David McLaren on 5/15/14.
//  Copyright (c) 2014 David McLaren. All rights reserved.
//

#import "camelCaseString.h"

@implementation NSString (camelCaseString)

-(NSString *) camelCaseString
{
    NSString *output = self;
    NSArray *components = [self componentsSeparatedByString:@", "];
    
    output = components[0];
    
    for (int i = 1; i < [components count]; ++i) {
        output = [output stringByAppendingString:[components[i] capitalizedString]];
    }
    
    output = [output stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    return output;
}

@end
