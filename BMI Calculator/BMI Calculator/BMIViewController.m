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
@synthesize resultImage;

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"stardust.png"]];
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
	
    if (![self.heightTextField.text isEqualToString:@""] && ![self.weightTextField.text isEqualToString:@""]) {
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
            heightBMI = [self.heightTextField.text integerValue] * 0.0254;
            NSLog(@"Height: %2.2f m", heightBMI);
            weightBMI = [self.weightTextField.text integerValue] * 0.453592;
            NSLog(@"Weight: %2.2f kg", weightBMI);
        }
        
        //Calculate BMI Range
        rangeBMI = (weightBMI / (heightBMI * heightBMI));
        NSLog(@"%2.2f", rangeBMI);
        
        //Calculate BMI Category
        if (isnan(rangeBMI)) {
            categoryBMI = @"Not Acceptable Input";
            self.resultLabel.text = [NSString stringWithFormat:@"%@", categoryBMI];
        } else if (rangeBMI == INFINITY){
            categoryBMI = @"Height cannot be 0";
            self.resultLabel.text = [NSString stringWithFormat:@"%@", categoryBMI];
        } else if (rangeBMI == 0) {
            categoryBMI = @"Weight cannot be 0";
            self.resultLabel.text = [NSString stringWithFormat:@"%@", categoryBMI];
        } else {
            if (rangeBMI < 16.00) {
                categoryBMI = @"Severe Thinness";
                [resultImage setImage:[UIImage imageNamed:@"thin3.png"]];
            } else if (rangeBMI < 17.00) {
                categoryBMI = @"Moderate Thinness";
                [resultImage setImage:[UIImage imageNamed:@"thin2.png"]];
            } else if (rangeBMI < 18.50) {
                categoryBMI = @"Mild Thinness";
                [resultImage setImage:[UIImage imageNamed:@"thin1.png"]];
            } else if (rangeBMI < 25.00) {
                categoryBMI = @"Normal Range";
                [resultImage setImage:[UIImage imageNamed:@"norm.png"]];
            } else if (rangeBMI < 30.00) {
                categoryBMI = @"Overweight";
                [resultImage setImage:[UIImage imageNamed:@"over.png"]];
            } else if (rangeBMI < 35.00) {
                categoryBMI = @"Obese Class I (Moderate)";
                [resultImage setImage:[UIImage imageNamed:@"obese1.png"]];
            } else if (rangeBMI < 40.00) {
                categoryBMI = @"Obese Class II (Severe)";
                [resultImage setImage:[UIImage imageNamed:@"obese2.png"]];
            } else {
                categoryBMI = @"Obese Class III (Very Severe)";
                [resultImage setImage:[UIImage imageNamed:@"obese3.png"]];
            }
            
            self.resultLabel.text = [NSString stringWithFormat:@"%2.2f %@", rangeBMI, categoryBMI];
        }
    } else {
        self.resultLabel.text = [NSString stringWithFormat:@"Please fill out both fields."];
    }
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
        self.heightTextField.placeholder = @"in inches";
		self.weightTextField.placeholder = @"in lbs";
    }
}

@end
