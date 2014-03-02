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

    // Create Calculator Data
    CalculatorData *calcData = [[CalculatorData alloc] initWithData:70.00 dollarsOff:-10 discount:20 additionalDiscount:5 tax:8.75];
    
    //Set Values to default data in view
    self.priceTextField.text = [NSString stringWithFormat:@"%.2f", [calcData price]];
    self.flatDollarsOffTextField.text = [NSString stringWithFormat:@"%d", [calcData dollarsOff]];
    self.percentDiscountTextField.text = [NSString stringWithFormat:@"%d", [calcData discount]];
    self.otherPercentTextField.text = [NSString stringWithFormat:@"%d", [calcData additionalDiscount]];
    self.taxTextField.text = [NSString stringWithFormat:@"%.2F", [calcData tax]];
    
    //Set labels to output
    self.originalPriceLabel.text = [NSString stringWithFormat:@"Original Price: \t\t%.2f", [calcData originalPrice]];
    self.discountPriceLabel.text = [NSString stringWithFormat:@"Discounted Price: \t%.2f", [calcData discountedPrice]];
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
