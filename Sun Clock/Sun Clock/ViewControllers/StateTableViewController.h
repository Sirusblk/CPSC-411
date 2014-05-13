//
//  StateTableViewController.h
//  Sun Clock
//
//  Created by David McLaren on 5/12/14.
//  Copyright (c) 2014 David McLaren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "US_Cities_DB.h"

@interface StateTableViewController : UITableViewController

@property (retain) US_Cities_DB *database;
@property (retain) NSString *timezone;
@property (retain) NSArray *states;

@end
