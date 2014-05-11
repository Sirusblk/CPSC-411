//
//  SunClockData.h
//  Sun Clock
//
//  Created by David McLaren on 5/1/14.
//  Copyright (c) 2014 David McLaren. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <libnova/solar.h>
#import <libnova/julian_day.h>
#import <libnova/rise_set.h>
#import <libnova/transform.h>

@interface SunClockData : NSObject <CLLocationManagerDelegate>
{
    struct ln_equ_posn equ;
	struct ln_rst_time rst;
	struct ln_zonedate rise, set;
	struct ln_lnlat_posn observer;
	struct ln_helio_posn pos;
	double JD;
    bool circumpolar;
}
@property CLLocation *observerLocation;
@property CLLocationManager *locationManager;
@property NSDate *dawn;
@property NSDate *sunrise;
@property NSDate *sunset;
@property NSDate *dusk;

+(SunClockData *) sunClock;
-(void) updateLocationLat:(double) latitude Long:(double) longitude;
-(void) updateDawn;
-(void) updateSunrise;
-(void) updateSunset;
-(void) updateDusk;

@end
