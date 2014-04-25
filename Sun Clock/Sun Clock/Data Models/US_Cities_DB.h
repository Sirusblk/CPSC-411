//
//  US_Cities_DB.h
//  Sun Clock
//
//  Created by David McLaren on 4/20/14.
//  Copyright (c) 2014 David McLaren. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sqlite3.h"

@interface US_Cities_DB : NSObject
@property sqlite3 * databaseConnection;
@property NSArray * US_Cities;

-(void) getInfo;
-(NSArray *) getTimeZones;
-(NSArray *) getStatesFromTimezone:(NSString *) time_zone;
-(NSArray *) getCitiesFromState:(NSString *) state;

@end
