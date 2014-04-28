//
//  City.m
//  Sun Clock
//
//  Created by David McLaren on 4/22/14.
//  Copyright (c) 2014 David McLaren. All rights reserved.
//

#import "City.h"

@implementation City

@synthesize name;
@synthesize state;
@synthesize coordinates;
@synthesize time_zone;

-(id) initWithName:(NSString *) input_name andState:(NSString *) input_state andCoord:(CLLocationCoordinate2D) input_coord andTimezone:(NSString *) input_time_zone {
    self = [super init];
    if (self) {
        name = input_name;
        state = input_state;
        coordinates = CLLocationCoordinate2DMake(input_coord.longitude, input_coord.latitude);
        time_zone = input_time_zone;
    }
    return self;
}

@end
