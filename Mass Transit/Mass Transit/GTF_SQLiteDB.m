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
    NSString* query = @"SELECT * FROM routes;";
    sqlite3_stmt *stmt;
    
    //Temporary stores
    const unsigned char* text;
    NSString *routeID, *routeLongName, *routeDesc, *routeColor;
    
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
            text = sqlite3_column_text(stmt, 3);
            if( text )
                routeLongName = [NSString stringWithCString: (const char*)text encoding:NSUTF8StringEncoding];
            else
                routeLongName = nil;
            
            //Grab route_desc
            text = sqlite3_column_text(stmt, 4);
            if( text )
                routeDesc = [NSString stringWithCString: (const char*)text encoding:NSUTF8StringEncoding];
            else
                routeDesc = nil;
            
            //Grab route_color
            text = sqlite3_column_text(stmt, 7);
            if( text )
                routeColor = [NSString stringWithCString: (const char*)text encoding:NSUTF8StringEncoding];
            else
                routeColor = nil;
            
            //Create TransitRoute Object and store in array
            TransitRoute *transitRoute = [[TransitRoute alloc] initWithID:routeID longName:routeLongName desc:routeDesc color:routeColor];
            [routeArray addObject:transitRoute];
        }
        sqlite3_finalize(stmt);
    }
    
    //Return mutable array as nonmutable array
    return routeArray;
}

-(NSArray*) stopTimes:(NSString*) routeID {
    //Store the results in a mutable array
    NSMutableArray* stopTimesArray = [[NSMutableArray alloc] init];
    NSString* query = [NSString stringWithFormat:@"SELECT * FROM stop_times, trips, routes WHERE trips.route_id = '%@' AND trips.trip_id = stop_times.trip_id;", routeID];
    sqlite3_stmt *stmt;
    
    //Send the query, store results in stmt.
    if(sqlite3_prepare_v2(databaseConnection, [query UTF8String], [query length], &stmt, nil) == SQLITE_OK)
    {
        //Step through the results
        while(sqlite3_step(stmt) == SQLITE_ROW)
        {
            
        }
    }
    
    //Return mutable array as nonmutable array
    return stopTimesArray;
}

@end
