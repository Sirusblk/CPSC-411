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
@synthesize userData;
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
    userData = [[CalculatorData alloc] initWithData:70.00 dollarsOff:10 discount:20 additionalDiscount:5 tax:8.75];
    
    //Set Values to default data in view
    [self updateView];
    
    //Make Swipe Gesture
    UISwipeGestureRecognizer* swipeLeftGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget: self action: @selector(handleSwipeLeftFrom:)];
    swipeLeftGestureRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer: swipeLeftGestureRecognizer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField*)sender {
	NSLog(@"Keyboard Closed.");
	[sender resignFirstResponder];
	return YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	[self.priceTextField resignFirstResponder];
    [self.flatDollarsOffTextField resignFirstResponder];
    [self.percentDiscountTextField resignFirstResponder];
    [self.otherPercentTextField resignFirstResponder];
    [self.taxTextField resignFirstResponder];
}

- (IBAction)calculateButtonPressed:(id)sender
{
    self.errorLabel.font = [UIFont fontWithName:@"Arial" size:17.0];
    
    if ([self.priceTextField.text floatValue] == 0) {
        self.errorLabel.text = @"Error: Please enter in a price!";
    } else if ([self.taxTextField.text floatValue] == 0) {
        self.errorLabel.text = @"Error: Please enter in tax!";
    } else {
        //Grab Data
        userData.price = [self.priceTextField.text floatValue];
        userData.dollarsOff = fabsf([self.flatDollarsOffTextField.text floatValue]);
        userData.discount = [self.percentDiscountTextField.text floatValue];
        userData.additionalDiscount = [self.otherPercentTextField.text floatValue];
        userData.tax = [self.taxTextField.text floatValue];
        
        self.errorLabel.font = [UIFont fontWithName:@"Snell Roundhand" size:24.0];
        self.errorLabel.text = @"Swipe right to view Graph";
        
        [self updateView];
    }

    NSLog(@"Calculate Pressed!");
}

- (void) updateView {
    self.priceTextField.text = [NSString stringWithFormat:@"%.2f", [userData price]];
    self.flatDollarsOffTextField.text = [NSString stringWithFormat:@"%.f", [userData dollarsOff]];
    self.percentDiscountTextField.text = [NSString stringWithFormat:@"%.f", [userData discount]];
    self.otherPercentTextField.text = [NSString stringWithFormat:@"%.f", [userData additionalDiscount]];
    self.taxTextField.text = [NSString stringWithFormat:@"%.2F", [userData tax]];
    
    //Set labels to output
    self.originalPriceLabel.text = [NSString stringWithFormat:@"Original Price: \t\t%.2f", [userData originalPrice]];
    self.discountPriceLabel.text = [NSString stringWithFormat:@"Discounted Price: \t%.2f", [userData discountedPrice]];
}

- (void)handleSwipeLeftFrom:(UIGestureRecognizer*)recognizer {
    [self performSegueWithIdentifier:@"CalculateGraph" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"Swiped!");

    if ([[segue identifier] isEqualToString:@"CalculateGraph"]) {
        //Get Destination View
        CalculatorViewController *secondViewController = [segue destinationViewController];
        
        //Pass Information
        secondViewController.userData = [self userData];
    }
}

@end
