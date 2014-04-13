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

@synthesize OCTA_database;
@synthesize OCTA_stopTimes;

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
    // Do any additional setup after loading the view.
    
    //IMPORTANT...?
    self.detailView.delegate = self;
    self.detailView.dataSource = self;
    
    NSMutableString *text = [NSMutableString stringWithString:@"Stops:\n"];
    NSLog(@"DEBUG: %@", text);
    
    //This is where the magic happens!
    [(DetailView*)self.view setHeaderColor:currentRoute.route_color];
    
    //Display stop times
    OCTA_database = [[GTF_SQLiteDB alloc] initWithName:@"OCTA"];
    OCTA_stopTimes = [OCTA_database tenStops:currentRoute.route_id];
    
    if ([queryType  isEqualToString: @"Bus Routes"]) {
        [headerIcon setImage:[UIImage imageNamed:@"bus-head.png"]];
        headerIcon.clipsToBounds = YES;
        [headerText setText:[NSString stringWithFormat:@"Bus Route %@", currentRoute.route_id]];
        
        NSLog(@"Text Color: %@", currentRoute.route_text_color);
        
        if ([currentRoute.route_text_color isEqualToString: @"000000"])
            [headerText setTextColor:[UIColor blackColor]];
        else
            [headerText setTextColor:[UIColor whiteColor]];
        
        [subheadTitle setText:[NSString stringWithFormat:@"%@", currentRoute.route_long_name]];
        
        /*
        for (int i=0; i<[OCTA_stopTimes count]; i++) {
            [text appendString:@"\n\n"];
            [text appendString:[[OCTA_stopTimes objectAtIndex:i] stop_name]];
            [text appendString:@"\n"];
            [text appendString:[[OCTA_stopTimes objectAtIndex:i] departure_time]];
            //[detailTableView ]
        }
        
        //[detailStops setText:text];
         */
    }
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
    NSLog(@"Number of OCTA stop times: %lu", (unsigned long)[OCTA_stopTimes count]);
    return [OCTA_stopTimes count];
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
    
    StopLocation *stopLocation = [self.OCTA_stopTimes objectAtIndex: indexPath.row];
    //NSLog(@"%@ %@", stopLocation.stop_name, stopLocation.departure_time);
    cell.textLabel.text = [stopLocation returnTime];
    cell.detailTextLabel.text = stopLocation.stop_name;
    
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

@end
