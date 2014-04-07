//
//  DetailView.m
//  Mass Transit
//
//  Created by David McLaren on 4/6/14.
//  Copyright (c) 2014 David McLaren. All rights reserved.
//

#import "DetailView.h"

@implementation DetailView

@synthesize headerColor;

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
    double red, green, blue;
    
    //Header Bar
    //Green Color Fill
    red = [self redColorFromHexString:headerColor];
    green = [self greenColorFromHexString:headerColor];
    blue = [self blueColorFromHexString:headerColor];
    CGContextSetRGBFillColor(context, red, green, blue, 1.0);
    //CGContextSetRGBFillColor(context, 0.412, 0.545, 0.443, 1.0);
    CGContextFillRect(context, CGRectMake(0.0, 64.0, 320.0, 100.0));
    
    //Divider Bar
    CGContextSetRGBFillColor(context, 0.0, 0.0, 0.0, 0.8);
    CGContextFillRect(context, CGRectMake(0.0, 164.0, 320.0, 0.5));
}

-(double) redColorFromHexString:(NSString*)hexInput
{
    NSUInteger red, green, blue;
    sscanf([hexInput UTF8String], "%02X%02X%02X", &red, &green, &blue);
    
    return red/255.0;
}

-(double) greenColorFromHexString:(NSString*)hexInput
{
    NSUInteger red, green, blue;
    sscanf([hexInput UTF8String], "%02X%02X%02X", &red, &green, &blue);
    
    return green/255.0;
}

-(double) blueColorFromHexString:(NSString*)hexInput
{
    NSUInteger red, green, blue;
    sscanf([hexInput UTF8String], "%02X%02X%02X", &red, &green, &blue);
    
    return blue/255.0;
}

@end
