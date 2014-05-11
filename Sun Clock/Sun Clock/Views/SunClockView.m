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
    double circleSize = 200;
    CGPoint circleCenter = CGPointMake(self.frame.size.width/2.0, self.frame.size.height/2.0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // Draw Background
    CGContextSetRGBFillColor(context, 71/255.0f, 83/255.0f, 94/255.0f, 1.0);
    CGContextFillRect(context, CGRectMake(0.0, 0.0, 320.0, 500.0));
    
    // Draw Shadow
    CGContextSaveGState(context);
    CGContextSetShadow(context, CGSizeMake(0, 0), 8);
    
    // Draw Circle
    CGRect circleframe = CGRectMake(circleCenter.x - (circleSize / 2), circleCenter.y - (circleSize / 2), circleSize, circleSize);
    CGContextSetRGBFillColor(context, 50/255.0f, 65/255.0f, 82/255.0f, 1.0);
    CGContextFillEllipseInRect(context, circleframe);
    
    // Restore State for drop shadow
    CGContextRestoreGState(context);
    
    // Draw Dawn to Sunrise
    double origin = M_PI / 2;
    double start = origin + ((4.0 / 24.0 * 360) * (M_PI / 180));
    double end = origin + (5.0 / 24.0 * 360) * (M_PI / 180);

    NSLog(@"Origin: %f", origin);
    NSLog(@"Start:  %f", start);
    NSLog(@"End:    %f", end);
    
    CGContextSetRGBFillColor(context, 121/255.0f, 100/255.0f, 102/255.0f, 1.0);
    CGContextMoveToPoint(context, circleCenter.x, circleCenter.y);
    CGContextAddArc(context, circleCenter.x, circleCenter.y, circleSize / 2, start, end, 0);
    CGContextFillPath(context);
    
    // Draw Sunrise to Sunset
    
    // Draw Sunset to Dusk
}

@end
