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

@property NSString* stop_name;
@property CLLocationCoordinate2D coord;

-(id) initWithName:(NSString*)stopName coord:(CLLocationCoordinate2D) inputCoord;

@end
