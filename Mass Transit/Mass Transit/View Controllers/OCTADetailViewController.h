//
//  OCTADetailViewController.h
//  Mass Transit
//
//  Created by David McLaren on 4/5/14.
//  Copyright (c) 2014 David McLaren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GTF_SQLiteDB.h"
#import "TransitRoute.h"
#import "DetailView.h"

@interface OCTADetailViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property NSString *queryType;
@property TransitRoute *currentRoute;

@property GTF_SQLiteDB* OCTA_database;
@property NSArray* OCTA_stopTimes;

@property (weak, nonatomic) IBOutlet UIImageView *headerIcon;
@property (weak, nonatomic) IBOutlet UILabel *headerText;
@property (weak, nonatomic) IBOutlet UILabel *subheadTitle;
@property (weak, nonatomic) IBOutlet UITableView *detailView;

@end
