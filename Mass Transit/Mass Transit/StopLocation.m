//
//  StopLocations.m
//  Mass Transit
//
//  Created by David McLaren on 4/6/14.
//  Copyright (c) 2014 David McLaren. All rights reserved.
//

#import "StopLocation.h"

@implementation StopLocation

@synthesize stop_id;
@synthesize departure_time;
@synthesize stop_name;
@synthesize coord;

-(id) initWithID:(NSString*)stopID departure:(NSString*) departureTime stopName:(NSString*) stopName coord:(CLLocationCoordinate2D) inputCoord
{
    self = [super init];
    if (self) {
        stop_id = stopID;
        departure_time = departureTime;
        stop_name = stopName;
        coord = inputCoord;
    }
    return self;
}

-(NSString*) returnTime
{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    NSLocale *localTime = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    [dateFormat setLocale:localTime];
    [dateFormat setDateFormat:@"HH:mm:ss"];
    NSDate *time = [dateFormat dateFromString:(NSString*) departure_time];
    //NSLog(@"Time: %@", time);
    
    //Change format!
    [dateFormat setDateFormat:@"hh:mm a"];
    
    NSString *output = [dateFormat stringFromDate:time];
    //NSLog(@"Output Time: %@", output);
    
    return output;
}

@end
