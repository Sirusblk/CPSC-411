//
//  SunClockData.h
//  Sun Clock
//
//  Created by David McLaren on 5/1/14.
//  Copyright (c) 2014 David McLaren. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#include <libnova/solar.h>
#include <libnova/julian_day.h>
#include <libnova/rise_set.h>
#include <libnova/transform.h>

@interface SunClockData : NSObject
@property CLLocationCoordinate2D observerLocation;
@property NSDate * sunrise;
@property NSDate * sunset;

+(SunClockData *) sunClock;
-(void) updateLocationLat:(double) latitude Long:(double) longitude;

@end
