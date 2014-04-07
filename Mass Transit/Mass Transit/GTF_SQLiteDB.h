//
//  GTF_SQLiteDB.h
//  Mass Transit
//
//  Created by David McLaren on 4/4/14.
//  Copyright (c) 2014 David McLaren. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TransitRoute.h"
#import "sqlite3.h"

@interface GTF_SQLiteDB : NSObject

@property sqlite3* databaseConnection;

+(GTF_SQLiteDB*) database;
- (id) initWithName:(NSString*) databaseName;
-(NSArray*) routes;
-(NSArray*) stopTimes:(NSString*) routeID;

@end
