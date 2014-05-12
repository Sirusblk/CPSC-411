//
//  SunClockView.m
//  Sun Clock
//
//  Created by David McLaren on 4/27/14.
//  Copyright (c) 2014 David McLaren. All rights reserved.
//

#import "SunClockView.h"

@implementation SunClockView

@synthesize dawn;
@synthesize sunrise;
@synthesize sunset;
@synthesize dusk;

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
    
    double origin = M_PI / 2;
    
    // Draw Dawn to Sunrise
    double startHours = [self getHours: dawn];
    double startMin = [self getMinutes: dawn];
    double endHours = [self getHours: sunrise];
    double endMin = [self getMinutes: sunrise];
    
    double start = origin + ((360.0 / 24.0) * (startHours + (startMin / 60.0)) * (M_PI / 180));
    double end = origin + (360.0 / 24.0) * (endHours + (endMin / 60.0)) * (M_PI / 180);

    NSLog(@"Origin: %f", origin);
    NSLog(@"Start:  %f", start);
    NSLog(@"End:    %f", end);
    
    CGContextSetRGBFillColor(context, 121/255.0f, 100/255.0f, 102/255.0f, 1.0);
    CGContextMoveToPoint(context, circleCenter.x, circleCenter.y);
    CGContextAddArc(context, circleCenter.x, circleCenter.y, circleSize / 2, start, end, 0);
    CGContextFillPath(context);
    
    // Draw Sunrise to Sunset
    startHours = endHours;
    startMin = endMin;
    endHours = [self getHours:sunset];
    endMin = [self getMinutes:sunset];
    
    start = origin + ((360.0 / 24.0) * (startHours + (startMin / 60.0)) * (M_PI / 180));
    end = origin + (360.0 / 24.0) * (endHours + (endMin / 60.0)) * (M_PI / 180);
    
    CGContextSetRGBFillColor(context, 193/255.0f, 131/255.0f, 106/255.0f, 1.0);
    CGContextMoveToPoint(context, circleCenter.x, circleCenter.y);
    CGContextAddArc(context, circleCenter.x, circleCenter.y, circleSize / 2, start, end, 0);
    CGContextFillPath(context);
    
    // Draw Sunset to Dusk
    startHours = endHours;
    startMin = endMin;
    endHours = [self getHours:dusk];
    endMin = [self getMinutes:dusk];
    
    start = origin + ((360.0 / 24.0) * (startHours + (startMin / 60.0)) * (M_PI / 180));
    end = origin + (360.0 / 24.0) * (endHours + (endMin / 60.0)) * (M_PI / 180);
    
    CGContextSetRGBFillColor(context, 121/255.0f, 100/255.0f, 102/255.0f, 1.0);
    CGContextMoveToPoint(context, circleCenter.x, circleCenter.y);
    CGContextAddArc(context, circleCenter.x, circleCenter.y, circleSize / 2, start, end, 0);
    CGContextFillPath(context);
}

-(void) setDawn:(NSDate *) input_dawn Sunrise:(NSDate *) input_sunrise Sunset:(NSDate *) input_sunset Dusk:(NSDate *) input_dusk
{
    dawn = input_dawn;
    sunrise = input_sunrise;
    sunset = input_sunset;
    dusk = input_dusk;
    
    assert(dawn);
    assert(sunrise);
    assert(sunset);
    assert(dusk);
}

-(double) getHours:(NSDate *) input
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSHourCalendarUnit | NSMinuteCalendarUnit) fromDate:input];
    NSNumber *hours = [NSNumber numberWithUnsignedInteger:[components hour]];
    return [hours doubleValue];
}

-(double) getMinutes:(NSDate *) input
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSHourCalendarUnit | NSMinuteCalendarUnit) fromDate:input];
    NSNumber *mins = [NSNumber numberWithUnsignedInteger:[components minute]];
    return [mins doubleValue];
}

@end
