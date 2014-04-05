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
@property NSString* databaseName;

+(GTF_SQLiteDB*) database;
-(NSArray*) routes;

@end
