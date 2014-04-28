//
//  CityTableViewController.h
//  Sun Clock
//
//  Created by David McLaren on 4/20/14.
//  Copyright (c) 2014 David McLaren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "US_Cities_DB.h"

@interface StateTableViewController : UITableViewController

@property US_Cities_DB * database;
@property NSArray * time_zones;
@property NSArray * states;

@end
