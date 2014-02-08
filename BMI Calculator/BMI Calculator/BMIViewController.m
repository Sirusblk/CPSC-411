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
	
	NSString *categoryBMI = [NSString alloc];
    float rangeBMI;
    float heightBMI;
    float weightBMI;
    
    //Check for Metric Units toggle, convert to metric!
    if (self.metricSwitchOutlet.isOn) {
        //Nothing changes, already in metric
        heightBMI = [self.heightTextField.text integerValue] / 100.00;
        NSLog(@"Height: %2.2f m", heightBMI);
        weightBMI = [self.weightTextField.text integerValue];
        NSLog(@"Weight: %2.2f kg", weightBMI);
    } else {
        //Must convert to metric, change below!
        heightBMI = 0;
        weightBMI = 0;
    }
    
    //Calculate BMI Range
    rangeBMI = (weightBMI / (heightBMI * heightBMI));
    NSLog(@"%2.2f", rangeBMI);
    
    //Calculate BMI Category
    if (rangeBMI < 16.00) {
        categoryBMI = @"Severe Thinness";
    } else if (rangeBMI < 17.00) {
        categoryBMI = @"Moderate Thinness";
    } else if (rangeBMI < 18.50) {
        categoryBMI = @"Mild Thinness";
    } else if (rangeBMI < 25.00) {
        categoryBMI = @"Normal Range";
    } else if (rangeBMI < 30.00) {
        categoryBMI = @"Overweight";
    } else if (rangeBMI < 35.00) {
        categoryBMI = @"Obese Class I (Moderate)";
    } else if (rangeBMI < 40.00) {
        categoryBMI = @"Obese Class II (Severe)";
    } else {
        categoryBMI = @"Obese Class III (Very Severe)";
    }
	
	self.resultLabel.text = [NSString stringWithFormat:@"%2.2f %@", rangeBMI, categoryBMI];
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
