//
//  CalculatorViewController.m
//  Discount Calculator
//
//  Created by David McLaren on 2/25/14.
//  Copyright (c) 2014 David McLaren. All rights reserved.
//

#import "CalculatorViewController.h"
#import "GraphViewController.h"

@interface CalculatorViewController ()

@end

@implementation CalculatorViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField*)sender {
	NSLog(@"Keyboard Closed.");
	[sender resignFirstResponder];
	return YES;
}

- (IBAction)calculateButtonPressed:(id)sender
{
    NSLog(@"Calculate Pressed!");
    [self performSegueWithIdentifier:@"CalculateGraph" sender: sender];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"CalculateGraph"]) {
        //Get Destination View
        CalculatorViewController *secondViewController = [segue destinationViewController];
        
        //Pass Information
    }
}
@end
