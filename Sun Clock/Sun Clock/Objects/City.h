//
//  City.h
//  Sun Clock
//
//  Created by David McLaren on 4/22/14.
//  Copyright (c) 2014 David McLaren. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface City : NSObject

@property NSString * name;
@property NSString * state;
@property CLLocationCoordinate2D coordinates;
@property NSString * time_zone;

-(id) initWithName:(NSString *) input_name andState:(NSString *) input_state andCoord:(CLLocationCoordinate2D) input_coord andTimezone:(NSString *) input_time_zone;

@end
