//
//  BMIViewController.h
//  BMI Calculator
//
//  Created by David McLaren on 2/7/14.
//  Copyright (c) 2014 David McLaren. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BMIViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *heightLabel;
@property (weak, nonatomic) IBOutlet UITextField *weightLabel;
@property (weak, nonatomic) IBOutlet UISwitch *metricSwitch;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@end
