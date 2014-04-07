//
//  OCTADetailTableViewController.m
//  Mass Transit
//
//  Created by David McLaren on 4/5/14.
//  Copyright (c) 2014 David McLaren. All rights reserved.
//

#import "OCTADetailViewController.h"

@interface OCTADetailViewController ()

@end

@implementation OCTADetailViewController

@synthesize queryType;
@synthesize currentRoute;

@synthesize headerIcon;
@synthesize headerText;
@synthesize subheadTitle;
@synthesize subheadSubtitle;
@synthesize detailDesc;
@synthesize detailStops;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //This is where the magic happens!
    [(DetailView*)self.view setHeaderColor:currentRoute.route_color];
    
    if ([queryType  isEqualToString: @"Bus Routes"]) {
        [headerIcon setImage:[UIImage imageNamed:@"bus-head.png"]];
        //headerIcon.layer.cornerRadius = 28;
        headerIcon.clipsToBounds = YES;
        [headerText setText:[NSString stringWithFormat:@"Bus Route #%@", currentRoute.route_id]];
        [headerText setTextColor:[UIColor whiteColor]];
        [subheadTitle setText:[NSString stringWithFormat:@"%@", currentRoute.route_long_name]];
        [subheadSubtitle setText:[NSString stringWithFormat:@"%@", currentRoute.route_desc]];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
