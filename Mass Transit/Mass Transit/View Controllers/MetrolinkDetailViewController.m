//
//  MetrolinkDetailViewController.m
//  Mass Transit
//
//  Created by David McLaren on 4/4/14.
//  Copyright (c) 2014 David McLaren. All rights reserved.
//

#import "MetrolinkDetailViewController.h"

@interface MetrolinkDetailViewController ()

@end

@implementation MetrolinkDetailViewController

@synthesize queryType;
@synthesize currentRoute;

@synthesize headerIcon;
@synthesize headerText;
@synthesize subheadTitle;
@synthesize subheadSubtitle;
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
    [(DetailView*)self.view setHeaderColor:currentRoute.route_color];
    
    [headerIcon setImage:[UIImage imageNamed:@"train-head.png"]];
    headerIcon.clipsToBounds = YES;
    [headerText setText:[NSString stringWithFormat:@"Train Route %@", currentRoute.route_id]];
    [headerText setTextColor:[UIColor whiteColor]];
    [subheadTitle setText:[NSString stringWithFormat:@"%@", currentRoute.route_long_name]];
    [subheadSubtitle setText:[NSString stringWithFormat:@"%@", currentRoute.route_desc]];
    [detailStops setText:@""];
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
