//
//  BMIViewController.h
//  BMI Calculator
//
//  Created by David McLaren on 2/7/14.
//  Copyright (c) 2014 David McLaren. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BMIViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *heightTextField;
@property (weak, nonatomic) IBOutlet UITextField *weightTextField;
@property (weak, nonatomic) IBOutlet UISwitch *metricSwitchOutlet;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (weak, nonatomic) IBOutlet UIImageView *resultImage;

- (IBAction)calculatePressed:(id)sender;
- (IBAction)metricSwitch:(id)sender;

@end
