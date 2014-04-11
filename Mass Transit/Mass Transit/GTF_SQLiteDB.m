//
//  GTF_SQLiteDB.m
//  Mass Transit
//
//  Created by David McLaren on 4/4/14.
//  Copyright (c) 2014 David McLaren. All rights reserved.
//

#import "GTF_SQLiteDB.h"

@implementation GTF_SQLiteDB

static GTF_SQLiteDB* _databaseObject;

@synthesize databaseConnection;

+(GTF_SQLiteDB*) database {
    if (_databaseObject == nil) {
        _databaseObject = [[GTF_SQLiteDB alloc] init];
    }
    return _databaseObject;
}

- (id) initWithName:(NSString*) databaseName {
    self = [super init];
    if (self) {
        NSString* dbpath = [[NSBundle mainBundle] pathForResource:databaseName ofType:@"sl3"];
        if (sqlite3_open([dbpath UTF8String], &databaseConnection) != SQLITE_OK) {
            NSLog(@"Failed to open database.");
        }
    }
    return self;
}

-(NSArray*) routes {
    //Store the results in a mutable array
    NSMutableArray* routeArray = [[NSMutableArray alloc] init];
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *comps = [gregorian components:NSWeekdayCalendarUnit fromDate:[NSDate date]];
    int weekday = [comps weekday];
    NSString* today = [[NSString alloc] init];
    
    if (weekday == 1) {
        today = @"SU";
    } else if (weekday == 7) {
        today = @"SA";
    } else {
        today = @"WD";
    }
    
    NSString* query = @"SELECT route_id, route_long_name, route_color, route_text_color FROM routes;";
    //NSString* query = [NSString stringWithFormat:@"SELECT DISTINCT * FROM routes, trips WHERE routes.route_id=trips.route_id AND trips.service_id='%@';", today];
    sqlite3_stmt *stmt;
    
    //Temporary stores
    const unsigned char* text;
    NSString *routeID, *routeLongName, *routeColor, *routeTextColor;
    
    //Send the query, store results in stmt.
    if(sqlite3_prepare_v2(databaseConnection, [query UTF8String], [query length], &stmt, nil) == SQLITE_OK)
    {
        //Step through the results
        while(sqlite3_step(stmt) == SQLITE_ROW)
        {
            //Grab route_id
            text = sqlite3_column_text(stmt, 0);
            if(text)
                routeID = [NSString stringWithCString: (const char*)text encoding:NSUTF8StringEncoding];
            else
                routeID = nil;
            
            //Grab route_long_name
            text = sqlite3_column_text(stmt, 1);
            if( text )
                routeLongName = [NSString stringWithCString: (const char*)text encoding:NSUTF8StringEncoding];
            else
                routeLongName = nil;
            
            //Grab route_color
            text = sqlite3_column_text(stmt, 2);
            if( text )
                routeColor = [NSString stringWithCString: (const char*)text encoding:NSUTF8StringEncoding];
            else
                routeColor = nil;
            
            //Grab route_text_color
            text = sqlite3_column_text(stmt, 3);
            if ( text )
                routeTextColor = [NSString stringWithCString: (const char*)text encoding:NSUTF8StringEncoding];
            else
                routeTextColor = @"FFFFFF";
            
            //Create TransitRoute Object and store in array
            TransitRoute *transitRoute = [[TransitRoute alloc] initWithID:routeID longName:routeLongName color:routeColor textColor: routeTextColor];
            [routeArray addObject:transitRoute];
        }
        sqlite3_finalize(stmt);
    }
    
    //Return mutable array as nonmutable array
    return routeArray;
}

-(NSArray*) stopTimes:(NSString*) routeID {
    // Grab current time
    NSDate *today = [NSDate date];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"HH:mm:ss"];
    NSString *currentTime = [dateFormat stringFromDate:today];
    NSLog(@"24 hour time: %@", currentTime);
    
    
    //Store the results in a mutable array
    NSMutableArray* stopTimesArray = [[NSMutableArray alloc] init];
    NSString* query = [NSString stringWithFormat:@"SELECT * FROM stop_times, trips, routes WHERE trips.route_id = '%@' AND trips.trip_id = stop_times.trip_id;", routeID];
    sqlite3_stmt *stmt;
    
    /*
    //Send the query, store results in stmt.
    if(sqlite3_prepare_v2(databaseConnection, [query UTF8String], [query length], &stmt, nil) == SQLITE_OK)
    {
        //Step through the results
        while(sqlite3_step(stmt) == SQLITE_ROW)
        {
            
        }
    }
     */
    
    //Return mutable array as nonmutable array
    return stopTimesArray;
}

-(NSArray*) stopLocations {
    //Store the results in a mutable array
    NSMutableArray* stopLocsArray = [[NSMutableArray alloc] init];
    NSString* query = @"SELECT * FROM stops;";
    sqlite3_stmt *stmt;
    
    //Temporary stores
    const unsigned char* text;
    NSString *stopName;
    double longitude, latitude;
    
    //Send the query, store results in stmt.
    if(sqlite3_prepare_v2(databaseConnection, [query UTF8String], [query length], &stmt, nil) == SQLITE_OK)
    {
        //Step through the results
        while(sqlite3_step(stmt) == SQLITE_ROW)
        {
            //Grab route_id
            text = sqlite3_column_text(stmt, 0);
            if(text)
                stopName = [NSString stringWithCString: (const char*)text encoding:NSUTF8StringEncoding];
            else
                stopName = nil;
        }
        
        longitude = sqlite3_column_double(stmt, 4);
        latitude = sqlite3_column_double(stmt, 5);
        CLLocationCoordinate2D coord = CLLocationCoordinate2DMake(longitude, latitude);
        
        //Create location and add to array
        StopLocation *locationItem = [[StopLocation alloc] initWithName:stopName coord:coord];
        [stopLocsArray addObject:locationItem];
    }
    
    //Return mutable array as nonmutable array
    return stopLocsArray;
}

@end
