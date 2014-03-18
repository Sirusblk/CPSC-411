//
//  CalculatorData.m
//  Calculator
//
//  Created by David McLaren on 3/17/14.
//  Copyright (c) 2014 David McLaren. All rights reserved.
//

#import "CalculatorData.h"

@implementation CalculatorData
//@synthesize lastTermString;
//@synthesize currentTermString;
@synthesize lastTerm;
@synthesize currentTerm;
@synthesize opCommand;

- (id) init
{
    self = [super init];
    
    if (self) {
        //[lastTermString setString:@""];
        //[currentTermString setString:@"0"];
        opCommand = @"";
    }
    
    return self;
}

- (void)calculate
{
    float result = 0;
    
    if ([opCommand isEqual: @"+"]) {
        result = lastTerm + currentTerm;
    } else if ([opCommand isEqual: @"-"]) {
        result = lastTerm - currentTerm;
    } else if ([opCommand isEqual: @"x"]) {
        result = lastTerm * currentTerm;
    } else if ([opCommand isEqual: @"÷"]) {
        result = lastTerm / currentTerm;
    } else {
        NSLog(@"ERROR: Calculate called on improper opCommand");
    }
    
    lastTerm = 0;
    currentTerm = result;
    opCommand = @"";
    //[lastTermString setString:@""];
    //[currentTermString setString:[NSString stringWithFormat:@"%f", currentTerm]];
}

- (NSString*)getLastTerm
{
    return [NSString stringWithFormat:@"%8.f", lastTerm];
}

- (NSString*)getCurrentTerm
{
    return [NSString stringWithFormat:@"%8.f", currentTerm];
}

@end
