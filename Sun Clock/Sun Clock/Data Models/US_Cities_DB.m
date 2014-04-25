//
//  US_Cities.m
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
        NSString* dbpath = [[NSBundle mainBundle] pathForResource:@"us_cities_with_timezones" ofType:@"sq3"];
        if (sqlite3_open([dbpath UTF8String], & databaseConnection) != SQLITE_OK) {
            NSLog(@"Failed to open database.");
        }
    }
    
    [self getInfo];
    
    return self;
}

- (void) dealloc {
    sqlite3_close(databaseConnection);
}

-(void) getInfo {
    
    //Do Something...
    
}

-(NSArray *) getTimeZones {
    NSMutableArray * timeZones;
    
    //Do Something...
    
    return (NSArray *) timeZones;
}

-(NSArray *) getStatesFromTimezone:(NSString *)time_zone {
    NSMutableArray * listOfStates;
    
    //Do Something...
    
    return (NSArray *) listOfStates;
}

-(NSArray *) getCitiesFromState:(NSString *)state {
    NSMutableArray * listOfCities;
    
    //Do Something...
    
    return (NSArray *) listOfCities;
}

@end
