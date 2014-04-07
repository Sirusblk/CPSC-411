//
//  DetailView.m
//  Mass Transit
//
//  Created by David McLaren on 4/6/14.
//  Copyright (c) 2014 David McLaren. All rights reserved.
//

#import "DetailView.h"

@implementation DetailView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //Header Bar
    //Green Color Fill
    CGContextSetRGBFillColor(context, 0.412, 0.545, 0.443, 1.0);
    CGContextFillRect(context, CGRectMake(0.0, 64.0, 320.0, 100.0));
    
    //Divider Bar
    CGContextSetRGBFillColor(context, 0.0, 0.0, 0.0, 0.8);
    CGContextFillRect(context, CGRectMake(0.0, 164.0, 320.0, 0.5));
}

@end
