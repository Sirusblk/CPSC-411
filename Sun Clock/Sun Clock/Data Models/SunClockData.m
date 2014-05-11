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
@synthesize locationManager;
@synthesize dawn;
@synthesize sunrise;
@synthesize sunset;
@synthesize dusk;

static SunClockData *clockData;

+(SunClockData *) sunClock {
    if (clockData == nil) {
        clockData = [[SunClockData alloc] init];
        clockData.locationManager = [[CLLocationManager alloc] init];
        clockData.locationManager.distanceFilter = kCLDistanceFilterNone;
        clockData.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    }
    
    return clockData;
}

-(id) init
{
    self = [super init];
    if (self) {
        circumpolar = true;
    }
    return self;
}

-(void) updateLocationLat:(double) latitude Long:(double) longitude {
    if (latitude == 0 || longitude == 0) {
        [clockData.locationManager startUpdatingLocation];
        [clockData.locationManager stopUpdatingLocation];
        //observerLocation = [clockData.locationManager lastObject];
    } else {
        //observerLocation = CLLocationCoordinate2DMake(latitude, longitude);
    }
}

#pragma mark - Sunrise

-(void) updateDawn
{
    //TEST DATA
    observer.lat = 33.907233;
    observer.lng = -117.857183;
    //---------
	
    /* get Julian day from local time */
	JD = ln_get_julian_from_sys();
	printf ("JD %f\n", JD);
	
	/* geometric coordinates */
	ln_get_solar_geom_coords (JD, &pos);
	printf("Solar Coords longitude (deg) %f\n", pos.L);
	printf("             latitude (deg) %f\n", pos.B);
	printf("             radius vector (AU) %f\n", pos.R);
	
	/* ra, dec */
	ln_get_solar_equ_coords (JD, &equ);
	printf("Solar Position RA %f\n", equ.ra);
	printf("               DEC %f\n", equ.dec);
    
    ln_get_solar_rst (JD, &observer, &rst);
    ln_get_local_date (rst.rise, &rise);
    
    NSLog(@"--------------------------");
    NSLog(@"Sun Rise: ");
    NSLog(@"    Years: %d", rise.years);
    NSLog(@"    Month: %d", rise.months);
    NSLog(@"    Days: %d", rise.days);
    NSLog(@"    Hours: %d", rise.hours);
    NSLog(@"    Minutes: %d", rise.minutes);
    NSLog(@"    Seconds: %.0f", rise.seconds);
    NSLog(@"--------------------------");
    
    NSString *dawnString = [NSString stringWithFormat:@"%d-%d-%d %d:%d:%.0f", rise.years, rise.months, rise.days, rise.hours, rise.minutes, rise.seconds];
    NSLog(@"Dawn is at: %@", dawnString);
    
    // Change this to create a date, not use Date Formatter
    NSDateFormatter *dateFormater = [[NSDateFormatter alloc] init];
    [dateFormater setDateFormat:@"yyyy-MM-DD HH:mm:ss"];
    dawn = [dateFormater dateFromString:dawnString];
    
    assert(dawn);
    NSLog(@"Dawn: %@", dawn);
}

-(void) updateSunrise
{
    
}

#pragma mark - Sunset

-(void) updateSunset
{
    
}

-(void) updateDusk
{
    
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
    UIAlertView *errorAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    observerLocation = newLocation;
    
    if (observerLocation != nil) {
        //Do something here!
    }
}

@end
