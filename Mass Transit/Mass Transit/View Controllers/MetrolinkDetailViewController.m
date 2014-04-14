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

@synthesize Metrolink_database;
@synthesize Metrolink_stopTimes;

@synthesize headerIcon;
@synthesize headerText;
@synthesize subheadTitle;
@synthesize detailView;

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
    
    //IMPORTANT!
    self.detailView.delegate = self;
    self.detailView.dataSource = self;
    
    [(DetailView*)self.view setHeaderColor:currentRoute.route_color];
    
    NSLog(@"Current Route: %@", currentRoute);
    
    //Display stop times
    Metrolink_database = [[GTF_SQLiteDB alloc] initWithName:@"Metrolink"];
    Metrolink_stopTimes = [Metrolink_database tenStops:currentRoute.route_id];
    
    [headerIcon setImage:[UIImage imageNamed:@"train-head.png"]];
    headerIcon.clipsToBounds = YES;
    [headerText setText:[NSString stringWithFormat:@"Train Route %@", currentRoute.route_id]];
    
    NSLog(@"Text Color: %@", currentRoute.route_text_color);
    
    [headerText setTextColor:[UIColor whiteColor]];
    /*
    if ([currentRoute.route_text_color isEqualToString: @"FFFFFF"])
        [headerText setTextColor:[UIColor whiteColor]];
    else
        [headerText setTextColor:[UIColor blackColor]];
     */
    
    [subheadTitle setText:[NSString stringWithFormat:@"%@", currentRoute.route_long_name]];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    NSLog(@"Number of Metrolink stop times: %lu", (unsigned long)[Metrolink_stopTimes count]);
    return [Metrolink_stopTimes count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"detailCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    cell.textLabel.adjustsFontSizeToFitWidth = YES;
    
    // Configure the cell...
    if (cell == nil) {
		// Use the default cell style.
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:cellIdentifier];
    }
    
    StopLocation *stopLocation = [self.Metrolink_stopTimes objectAtIndex: indexPath.row];
    
    //Replace "Metrolink Station" which is at the end of every stop!
    NSMutableString* temp = (NSMutableString*)stopLocation.stop_name;
    temp = [[temp stringByReplacingOccurrencesOfString:@" Metrolink Station" withString:@""] mutableCopy];
    //NSLog(@"String Replace: %@", temp);
    
    cell.detailTextLabel.text = temp;
    cell.textLabel.text = [stopLocation returnTime];
    
    return cell;
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

- (IBAction)urlButtonPress:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:currentRoute.route_url]];
}
@end
