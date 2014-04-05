//
//  TransitRoute.m
//  Mass Transit
//
//  Created by David McLaren on 4/5/14.
//  Copyright (c) 2014 David McLaren. All rights reserved.
//

#import "TransitRoute.h"

@implementation TransitRoute

@synthesize route_id;
@synthesize route_long_name;
@synthesize route_desc;
@synthesize route_color;

-(id) initWithID:(NSNumber*) routeID longName:(NSString*) routeLongName desc:(NSString*) routeDesc
{
    self = [super init];
    if (self) {
        route_id = routeID;
        route_long_name = routeLongName;
        route_desc = routeDesc;
    }
    return self;
}

-(id) initWithID:(NSNumber*) routeID longName:(NSString*) routeLongName desc:(NSString*) routeDesc color:(NSString*) routeColor
{
    self = [super init];
    if (self) {
        route_id = routeID;
        route_long_name = routeLongName;
        route_desc = routeDesc;
        route_color = routeColor;
    }
    return self;
}

@end
