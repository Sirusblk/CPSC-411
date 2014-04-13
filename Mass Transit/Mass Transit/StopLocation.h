//
//  StopLocations.h
//  Mass Transit
//
//  Created by David McLaren on 4/6/14.
//  Copyright (c) 2014 David McLaren. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface StopLocation : NSObject

@property NSString* stop_id;
@property NSString* departure_time;
@property NSString* stop_name;
@property CLLocationCoordinate2D coord;

-(id) initWithID:(NSString*)stopID departure:(NSString*) departureTime stopName:(NSString*) stopName coord:(CLLocationCoordinate2D) inputCoord;
-(NSString*) returnTime;

@end
