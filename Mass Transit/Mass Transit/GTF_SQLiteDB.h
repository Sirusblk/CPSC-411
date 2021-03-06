//
//  GTF_SQLiteDB.h
//  Mass Transit
//
//  Created by David McLaren on 4/4/14.
//  Copyright (c) 2014 David McLaren. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "TransitRoute.h"
#import "StopLocation.h"
#import "sqlite3.h"

@interface GTF_SQLiteDB : NSObject

@property NSString* databaseName;
@property sqlite3* databaseConnection;

+(GTF_SQLiteDB*) database;
- (id) initWithName:(NSString*) databaseName;
-(NSArray*) routes;
-(NSArray*) tenStops:(NSString*) routeID;
-(NSArray*) stops:(NSString*) routeID;
-(NSArray*) allStops;

@end
