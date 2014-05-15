//
//  Thing.m
//  Final Review
//
//  Created by David McLaren on 5/15/14.
//  Copyright (c) 2014 David McLaren. All rights reserved.
//

#import "Thing.h"

@implementation Thing

@synthesize num;

-(id) copyWithZone:(NSZone *) zone
{
    Thing* copy = [[Thing allocWithZone:zone] init];
    
    if(copy) {
        copy.num = num;
    }
    
    return copy;
}

-(NSString *) formattedString
{
    NSNumberFormatter *format = [[NSNumberFormatter alloc] init];
    [format setFormat:@"##0.00"];
    NSString *output = [format stringFromNumber:num];
    
    return output;
}

@end
