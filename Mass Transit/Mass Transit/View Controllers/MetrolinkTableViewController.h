//
//  MetrolinkTableViewController.h
//  Mass Transit
//
//  Created by David McLaren on 4/4/14.
//  Copyright (c) 2014 David McLaren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GTF_SQLiteDB.h"
#import "MetrolinkDetailViewController.h"

@interface MetrolinkTableViewController : UITableViewController

@property NSString* queryType;
@property GTF_SQLiteDB* Metrolink_database;
@property NSArray* Metrolink_routes;

@end
