//
//  SunClockData.m
//  Sun Clock
//
//  Created by David McLaren on 5/1/14.
//  Copyright (c) 2014 David McLaren. All rights reserved.
//

#import "SunClockData.h"

@implementation SunClockData

@synthesize observerLocation;
@synthesize sunrise;
@synthesize sunset;

static SunClockData * clockData;

+(SunClockData *) sunClock {
    if (clockData == nil) {
        clockData = [[SunClockData alloc] init];
    }
    
    return clockData;
}

-(void) updateLocationLat:(double) latitude Long:(double) longitude {
    
}

@end
