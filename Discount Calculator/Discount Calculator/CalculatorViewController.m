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
@synthesize priceTextField;
@synthesize flatDollarsOffTextField;
@synthesize percentDiscountTextField;
@synthesize otherPercentTextField;
@synthesize taxTextField;
@synthesize originalPriceLabel;
@synthesize discountPriceLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    // Create Calculator Data
    CalculatorData *calcData = [[CalculatorData alloc] initWithData:70.00 dollarsOff:-10.00 discount:20 additionalDiscount:5 tax:8.75];
    
    //Set Values to default data in view
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
    //Set
    
    NSLog(@"Calculate Pressed!");
}

- (void)handleSwipeLeftFrom:(UIGestureRecognizer*)recognizer {
    [self performSegueWithIdentifier:@"CakculateGraph" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"CalculateGraph"]) {
        //Get Destination View
        //CalculatorViewController *secondViewController = [segue destinationViewController];
        
        //Pass Information
    }
}
@end
