//
//  OCTADetailViewController.h
//  Mass Transit
//
//  Created by David McLaren on 4/5/14.
//  Copyright (c) 2014 David McLaren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TransitRoute.h"
#import "DetailView.h"

@interface OCTADetailViewController : UIViewController

@property NSString *queryType;
@property TransitRoute *currentRoute;

@property (weak, nonatomic) IBOutlet UIImageView *headerIcon;
@property (weak, nonatomic) IBOutlet UILabel *headerText;
@property (weak, nonatomic) IBOutlet UILabel *subheadTitle;
@property (weak, nonatomic) IBOutlet UILabel *subheadSubtitle;
@property (weak, nonatomic) IBOutlet UITextView *detailDesc;
@property (weak, nonatomic) IBOutlet UITextView *detailStops;

@end
