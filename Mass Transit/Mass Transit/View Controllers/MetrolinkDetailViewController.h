//
//  MetrolinkDetailViewController.h
//  Mass Transit
//
//  Created by David McLaren on 4/4/14.
//  Copyright (c) 2014 David McLaren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TransitRoute.h"
#import "DetailView.h"

@interface MetrolinkDetailViewController : UIViewController

@property NSString *queryType;
@property TransitRoute *currentRoute;

@property (weak, nonatomic) IBOutlet UIImageView *headerIcon;
@property (weak, nonatomic) IBOutlet UILabel *headerText;
@property (weak, nonatomic) IBOutlet UILabel *subheadTitle;
@property (weak, nonatomic) IBOutlet UILabel *subheadSubtitle;
@property (weak, nonatomic) IBOutlet UITextView *detailStops;

@end
