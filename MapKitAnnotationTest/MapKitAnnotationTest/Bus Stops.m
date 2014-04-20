//
//  Bus Stops.m
//  MapKitAnnotationTest
//
//  Created by David McLaren on 4/17/14.
//  Copyright (c) 2014 David McLaren. All rights reserved.
//

#import "Bus Stops.h"

@implementation Bus_Stops
@synthesize coordinate;

- (id)initWithLocation:(CLLocationCoordinate2D)coord {
    self = [super init];
    if (self) {
        coordinate = coord;
    }
    return self;
}

@end
