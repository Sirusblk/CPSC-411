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

@end
