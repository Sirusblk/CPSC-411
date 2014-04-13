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
@synthesize route_url;
@synthesize route_color;
@synthesize route_text_color;

-(id) initWithID:(NSString*) routeID longName:(NSString*) routeLongName url:(NSString*) routeURL
{
    self = [super init];
    if (self) {
        route_id = routeID;
        route_long_name = routeLongName;
        route_url = routeURL;
    }
    return self;
}

-(id) initWithID:(NSString*) routeID longName:(NSString*) routeLongName url:(NSString*) routeURL color:(NSString*) routeColor textColor:(NSString*) routeTextColor
{
    self = [super init];
    if (self) {
        route_id = routeID;
        route_long_name = routeLongName;
        route_url = routeURL;
        route_color = routeColor;
        route_text_color = routeTextColor;
    }
    return self;
}

@end
