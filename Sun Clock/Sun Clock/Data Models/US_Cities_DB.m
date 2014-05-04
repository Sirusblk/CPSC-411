//
//  US_Cities_DB.m
//  Sun Clock
//
//  Created by David McLaren on 4/20/14.
//  Copyright (c) 2014 David McLaren. All rights reserved.
//

#import "US_Cities_DB.h"

@implementation US_Cities_DB
@synthesize databaseConnection;
@synthesize US_Cities;

static US_Cities_DB * databaseObject;

+(US_Cities_DB *) database {
    if (databaseObject == nil) {
        databaseObject = [[US_Cities_DB alloc] init];
    }
    
    return databaseObject;
}

-(id) init {
    self = [super init];
    
    if (self) {
        NSString* dbpath = [[NSBundle mainBundle] pathForResource:@"us_cities_with_timezones" ofType:@"sl3"];
        if (sqlite3_open([dbpath UTF8String], & databaseConnection) != SQLITE_OK) {
            NSLog(@"Failed to open database.");
        }
    }
    
    return self;
}

- (void) dealloc {
    sqlite3_close(databaseConnection);
}

-(void) getInfo {
    NSMutableArray * results = [[NSMutableArray alloc] init];
    NSString* query = @"SELECT * FROM cities;";
    sqlite3_stmt *stmt;
    const unsigned char* text;
    NSString *name, *state, *time_zone;
    double longitude, latitude;
    
    if(sqlite3_prepare_v2(databaseConnection, [query UTF8String], [query length], &stmt, nil) == SQLITE_OK){
        while(sqlite3_step(stmt) == SQLITE_ROW) {
            text = sqlite3_column_text(stmt, 0);
            if(text)
                name = [NSString stringWithCString:(const char *) text encoding:NSUTF8StringEncoding];
            else
                name = nil;
            text = sqlite3_column_text(stmt, 1);
            if(text)
                state = [NSString stringWithCString:(const char *) text encoding:NSUTF8StringEncoding];
            else
                state = nil;
            latitude = sqlite3_column_double(stmt, 2);
            longitude = sqlite3_column_double(stmt, 3);
            CLLocationCoordinate2D coord = CLLocationCoordinate2DMake(latitude, longitude);
            text = sqlite3_column_text(stmt, 4);
            if(text)
                time_zone = [NSString stringWithCString:(const char *) text encoding:NSUTF8StringEncoding];
            else
                time_zone = nil;
            City *thisCity = [[City alloc] initWithName:name andState:state andCoord:coord andTimezone:time_zone];
            [results addObject:thisCity];
        }
        sqlite3_finalize(stmt);
    }
    
    US_Cities = (NSMutableArray *) results;
}

-(NSArray *) getTimeZones {
    NSMutableArray * timeZones = [[NSMutableArray alloc] init];;
    NSString* query = @"SELECT DISTINCT(time_zone) FROM cities;";
    sqlite3_stmt *stmt;
    const unsigned char* text;
    NSString *time_zone;
    
    assert(self.databaseConnection != NULL);
    
    if(sqlite3_prepare_v2(self.databaseConnection, [query UTF8String], [query length], &stmt, NULL) == SQLITE_OK) {
        while(sqlite3_step(stmt) == SQLITE_ROW) {
            text = sqlite3_column_text(stmt, 0);
            if(text)
                time_zone = [NSString stringWithCString:(const char *) text encoding:NSUTF8StringEncoding];
            else
                time_zone = nil;
            [timeZones addObject:time_zone];
        }
        sqlite3_finalize(stmt);
    }
    
    [timeZones sortUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    return (NSArray *) timeZones;
}

-(NSArray *) getStatesFromTimezone:(NSString *)time_zone {
    NSMutableArray * listOfStates = [[NSMutableArray alloc] init];;
    NSString* query = [NSString stringWithFormat:@"SELECT DISTINCT(state) WHERE time_zone = '%@' FROM cities;", time_zone];
    sqlite3_stmt *stmt;
    const unsigned char* text;
    NSString *state;
    
    if(sqlite3_prepare_v2(databaseConnection, [query UTF8String], [query length], &stmt, nil) == SQLITE_OK){
        while(sqlite3_step(stmt) == SQLITE_ROW) {
            text = sqlite3_column_text(stmt, 0);
            if(text)
                state = [NSString stringWithCString:(const char *) text encoding:NSUTF8StringEncoding];
            else
                state = nil;
            [listOfStates addObject:state];
        }
        sqlite3_finalize(stmt);
    }
    
    return (NSArray *) listOfStates;
}

-(NSArray *) getCitiesFromState:(NSString *)state {
    NSMutableArray * listOfCities = [[NSMutableArray alloc] init];;
    NSString* query = [NSString stringWithFormat:@"SELECT DISTINCT(name) WHERE state = '%@' FROM cities;", state];
    sqlite3_stmt *stmt;
    const unsigned char* text;
    NSString *city;
    
    if(sqlite3_prepare_v2(databaseConnection, [query UTF8String], [query length], &stmt, nil) == SQLITE_OK){
        while(sqlite3_step(stmt) == SQLITE_ROW) {
            text = sqlite3_column_text(stmt, 0);
            if(text)
                city = [NSString stringWithCString:(const char *) text encoding:NSUTF8StringEncoding];
            else
                city = nil;
            [listOfCities addObject:city];
        }
        sqlite3_finalize(stmt);
    }
    
    return (NSArray *) listOfCities;
}

@end
