//
//  SunClockView.m
//  Sun Clock
//
//  Created by David McLaren on 4/27/14.
//  Copyright (c) 2014 David McLaren. All rights reserved.
//

#import "SunClockView.h"

@implementation SunClockView

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    double circleSize = 250;
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // Draw Background
    CGContextSetRGBFillColor(context, 71/255.0f, 83/255.0f, 94/255.0f, 1.0);
    CGContextFillRect(context, CGRectMake(0.0, 0.0, 320.0, 430.0));
    
    // Draw Circle
    CGRect frame = CGRectMake(self.center.x - (circleSize / 2), self.center.y - (circleSize / 2), circleSize, circleSize);
    CGContextSetRGBFillColor(context, 50/255.0f, 65/255.0f, 82/255.0f, 1.0);
    CGContextFillEllipseInRect(context, frame);
    
    // Draw Dawn to Sunrise
    
    // Draw Sunrise to Sunset
    
    // Draw Sunset to Dusk
}

@end
