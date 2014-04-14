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

@synthesize databaseName;
@synthesize databaseConnection;

+(GTF_SQLiteDB*) database {
    if (_databaseObject == nil) {
        _databaseObject = [[GTF_SQLiteDB alloc] init];
    }
    return _databaseObject;
}

- (id) initWithName:(NSString*) _databaseName {
    self = [super init];
    if (self) {
        databaseName = _databaseName;
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
    
    //Grab the correct schedule
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
    
    NSString* query = @"SELECT route_id, route_long_name, route_color, route_text_color, route_url FROM routes;";
    
    if ([databaseName isEqualToString: @"OCTA"]) {
        query = [NSString stringWithFormat:@"SELECT DISTINCT trips.route_id, route_long_name, route_color, route_text_color, route_url FROM routes, trips WHERE trips.service_id = '%@' AND routes.route_id = trips.route_id;", today];
    }
    
    //NSString* query = [NSString stringWithFormat:@"SELECT DISTINCT trips.route_id, route_long_name, route_color, route_text_color, route_url FROM routes, trips WHERE trips.service_id = '%@' AND routes.route_id = trips.route_id;", today];
    sqlite3_stmt *stmt;
    
    //Temporary stores
    const unsigned char* text;
    NSString *routeID, *routeLongName, *routeColor, *routeTextColor, *routeURL;
    
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
            
            //Grab route_url
            text = sqlite3_column_text(stmt, 4);
            if ( text )
                routeURL = [NSString stringWithCString: (const char*)text encoding:NSUTF8StringEncoding];
            else
                routeURL = nil;
            
            //Create TransitRoute Object and store in array
            TransitRoute *transitRoute = [[TransitRoute alloc] initWithID:routeID longName:routeLongName url:routeURL color:routeColor textColor:routeTextColor];
            [routeArray addObject:transitRoute];
        }
        sqlite3_finalize(stmt);
    }
    
    //Return mutable array as nonmutable array
    return routeArray;
}

-(NSArray*) tenStops:(NSString*) routeID {
    //Store the results in a mutable array
    NSMutableArray* stopArray = [[NSMutableArray alloc] init];
    
    // Grab current time
    NSDate *todaysDate = [NSDate date];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"HH:mm:ss"];
    NSString *currentTime = [dateFormat stringFromDate:todaysDate];
    NSLog(@"24 hour time: %@", currentTime);
    
    NSString* query;
    
    if ([databaseName isEqualToString: @"OCTA"]) {
        //Grab the correct schedule
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
        
        query = [NSString stringWithFormat:@"SELECT stops.stop_id, departure_time, stop_name, stop_lat, stop_lon FROM stops, stop_times, trips, routes WHERE trips.service_id = '%@' AND trips.route_id = '%@' AND stop_times.departure_time >= '%@' AND trips.trip_id = stop_times.trip_id AND stops.stop_id = stop_times.stop_id LIMIT 10;", today, routeID, currentTime];
    } else {
        query = [NSString stringWithFormat:@"SELECT stops.stop_id, departure_time, stop_name, stop_lat, stop_lon FROM stops, stop_times, trips, routes WHERE trips.route_id = '%@' AND stop_times.departure_time >= '%@' AND trips.trip_id = stop_times.trip_id AND stops.stop_id = stop_times.stop_id LIMIT 10;", routeID, currentTime];
    }
    
    //Temporary stores
    const unsigned char* text;
    double lat, lon;
    NSString *stopID, *departueTime, *stopName;
    sqlite3_stmt *stmt;
    
    //Departure time and arrival time are the same for both OCTA and Metrolink,
    //Only store departure time.
    
    //Send the query, store results in stmt.
    if(sqlite3_prepare_v2(databaseConnection, [query UTF8String], [query length], &stmt, nil) == SQLITE_OK)
    {
        //Step through the results
        while(sqlite3_step(stmt) == SQLITE_ROW)
        {
            text = sqlite3_column_text(stmt, 0);
            if (text)
                stopID = [NSString stringWithCString: (const char*)text encoding:NSUTF8StringEncoding];
            else
                stopID = nil;
            
            text = sqlite3_column_text(stmt, 1);
            if (text)
                departueTime = [NSString stringWithCString: (const char*)text encoding:NSUTF8StringEncoding];
            else
                departueTime = nil;
            
            text = sqlite3_column_text(stmt, 2);
            if (text)
                stopName = [NSString stringWithCString: (const char*)text encoding:NSUTF8StringEncoding];
            else
                stopName = nil;
            
            lat = sqlite3_column_double(stmt, 3);
            lon = sqlite3_column_double(stmt, 4);
            
            CLLocationCoordinate2D coord = CLLocationCoordinate2DMake(lon, lat);
            StopLocation *stopLocation = [[StopLocation alloc] initWithID:stopID departure:departueTime stopName:stopName coord:coord];
            NSLog(@"Stop Location: %@", stopLocation);
            [stopArray addObject:stopLocation];
        }
    }
    
    //Return mutable array as nonmutable array
    return stopArray;
}

-(NSArray*) stops:(NSString*) routeID {
    //Store the results in a mutable array
    NSMutableArray* stopArray = [[NSMutableArray alloc] init];
    
    // Grab current time
    NSDate *todaysDate = [NSDate date];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"HH:mm:ss"];
    NSString *currentTime = [dateFormat stringFromDate:todaysDate];
    NSLog(@"24 hour time: %@", currentTime);
    
    //Grab the correct schedule
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
    
    //Temporary stores
    const unsigned char* text;
    double lat, lon;
    NSString *stopID, *departueTime, *stopName;
    
    
    NSString* query = [NSString stringWithFormat:@"SELECT stops.stop_id, departure_time, stop_name, stop_lat, stop_lon FROM stops, stop_times, trips, routes WHERE trips.service_id = '%@' AND trips.route_id = '%@' AND stop_times.departure_time >= '%@' AND trips.trip_id = stop_times.trip_id AND stops.stop_id = stop_times.stop_id;", today, routeID, currentTime];
    sqlite3_stmt *stmt;
    
    //Departure time and arrival time are the same for both OCTA and Metrolink,
    //Only store departure time.
    
    //Send the query, store results in stmt.
    if(sqlite3_prepare_v2(databaseConnection, [query UTF8String], [query length], &stmt, nil) == SQLITE_OK)
    {
        //Step through the results
        while(sqlite3_step(stmt) == SQLITE_ROW)
        {
            text = sqlite3_column_text(stmt, 0);
            if (text)
                stopID = [NSString stringWithCString: (const char*)text encoding:NSUTF8StringEncoding];
            else
                stopID = nil;
            
            text = sqlite3_column_text(stmt, 1);
            if (text)
                departueTime = [NSString stringWithCString: (const char*)text encoding:NSUTF8StringEncoding];
            else
                departueTime = nil;
            
            text = sqlite3_column_text(stmt, 2);
            if (text)
                stopName = [NSString stringWithCString: (const char*)text encoding:NSUTF8StringEncoding];
            else
                stopName = nil;
            
            lat = sqlite3_column_double(stmt, 3);
            lon = sqlite3_column_double(stmt, 4);
            
            CLLocationCoordinate2D coord = CLLocationCoordinate2DMake(lon, lat);
            StopLocation *stopLocation = [[StopLocation alloc] initWithID:stopID departure:departueTime stopName:stopName coord:coord];
            [stopArray addObject:stopLocation];
        }
    }
    
    //Return mutable array as nonmutable array
    return stopArray;
}

@end
