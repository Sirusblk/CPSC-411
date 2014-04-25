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
