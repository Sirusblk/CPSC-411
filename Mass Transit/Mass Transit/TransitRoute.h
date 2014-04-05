//
//  TransitRoute.h
//  Mass Transit
//
//  Created by David McLaren on 4/5/14.
//  Copyright (c) 2014 David McLaren. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TransitRoute : NSObject

@property NSNumber* route_id;
@property NSString* route_long_name;
@property NSString* route_desc;
@property NSString* route_color;    //Optional

-(id) initWithID:(NSNumber*) routeID longName:(NSString*) routeLongName desc:(NSString*) routeDesc;
-(id) initWithID:(NSNumber*) routeID longName:(NSString*) routeLongName desc:(NSString*) routeDesc color:(NSString*) routeColor;

@end
