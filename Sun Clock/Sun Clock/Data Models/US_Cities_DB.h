//
//  US_Cities_DB.h
//  Sun Clock
//
//  Created by David McLaren on 4/20/14.
//  Copyright (c) 2014 David McLaren. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <sqlite3.h>
#import "City.h"

@interface US_Cities_DB : NSObject
@property sqlite3 * databaseConnection;
@property NSArray * US_Cities;

+(US_Cities_DB *) database;
-(NSArray *) getTimeZones;
-(NSArray *) getStatesFromTimezone:(NSString *) time_zone;
-(NSArray *) getCitiesFromState:(NSString *) state;
-(NSString *) getLongitudeFromCity:(NSString *) city;
-(NSString *) getLatitudeFromCity:(NSString *) city;

@end
