//
//  BMIViewController.m
//  BMI Calculator
//
//  Created by David McLaren on 2/7/14.
//  Copyright (c) 2014 David McLaren. All rights reserved.
//

#import "BMIViewController.h"

@interface BMIViewController ()

@end

@implementation BMIViewController
@synthesize weightTextField;
@synthesize heightTextField;
@synthesize metricSwitchOutlet;
@synthesize resultLabel;

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

- (IBAction)calculatePressed:(id)sender {
	NSLog(@"Calculate Button Pressed.");
	
	/*
	NSString *t = self.myLabel.text;
	int x = [t intValue];
	x += 1;
	t = [NSString stringWithFormat:@"%d", x];
	self.myLabel.text = t;
	 */
	
	NSNumber *rangeBMI = [NSNumber alloc];
	NSString *categoryBMI = [NSString alloc];
	
	self.resultLabel.text = [NSString stringWithFormat:@"%@ %@", rangeBMI, categoryBMI];
}

- (IBAction)metricSwitch:(id)sender {
	if (self.metricSwitchOutlet.isOn) {
        self.heightTextField.text = @"";
        self.weightTextField.text = @"";
        self.heightTextField.placeholder = @"in cm";
        self.weightTextField.placeholder = @"in kg";
	} else {
        self.heightTextField.text = @"";
        self.weightTextField.text = @"";
        self.heightTextField.placeholder = @"in ft";
		self.weightTextField.placeholder = @"in lbs";
    }
}

@end
