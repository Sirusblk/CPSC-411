//
//  OCTATableViewController.h
//  Mass Transit
//
//  Created by David McLaren on 4/4/14.
//  Copyright (c) 2014 David McLaren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GTF_SQLiteDB.h"
#import "OCTADetailViewController.h"

@interface OCTATableViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>

@property NSString* queryType;
@property GTF_SQLiteDB* OCTA_database;
@property NSArray* OCTA_routes;

@end
