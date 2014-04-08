//
//  StopLocations.m
//  Mass Transit
//
//  Created by David McLaren on 4/6/14.
//  Copyright (c) 2014 David McLaren. All rights reserved.
//

#import "StopLocation.h"

@implementation StopLocation

@synthesize stop_name;
@synthesize coord;

-(id) initWithName:(NSString*)stopName coord:(CLLocationCoordinate2D) inputCoord
{
    self = [super init];
    if (self) {
        stop_name = stopName;
        coord = inputCoord;
    }
    return self;
}

@end
