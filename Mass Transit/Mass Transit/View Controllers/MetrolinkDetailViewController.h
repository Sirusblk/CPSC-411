//
//  MetrolinkDetailViewController.h
//  Mass Transit
//
//  Created by David McLaren on 4/4/14.
//  Copyright (c) 2014 David McLaren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GTF_SQLiteDB.h"
#import "TransitRoute.h"
#import "DetailView.h"

@interface MetrolinkDetailViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property NSString *queryType;
@property TransitRoute *currentRoute;

@property GTF_SQLiteDB* Metrolink_database;
@property NSArray* Metrolink_stopTimes;

@property (weak, nonatomic) IBOutlet UIImageView *headerIcon;
@property (weak, nonatomic) IBOutlet UILabel *headerText;
@property (weak, nonatomic) IBOutlet UILabel *subheadTitle;
@property (weak, nonatomic) IBOutlet UITableView *detailView;

@end
