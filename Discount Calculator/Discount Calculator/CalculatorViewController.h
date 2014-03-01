//
//  CalculatorViewController.h
//  Discount Calculator
//
//  Created by David McLaren on 2/25/14.
//  Copyright (c) 2014 David McLaren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalculatorData.h"

@interface CalculatorViewController : UIViewController
@property CalculatorData* userData;

- (IBAction)calculateButtonPressed:(id)sender;
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender;
@end
