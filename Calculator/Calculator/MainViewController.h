//
//  MainViewController.h
//  Calculator
//
//  Created by David McLaren on 3/14/14.
//  Copyright (c) 2014 David McLaren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalculatorData.h"

@interface MainViewController : UIViewController
@property CalculatorData *userData;
@property NSMutableString *lastTermString;
@property NSMutableString *currentTermString;

@property (weak, nonatomic) IBOutlet UILabel *pastTerm;
@property (weak, nonatomic) IBOutlet UILabel *opTerm;
@property (weak, nonatomic) IBOutlet UILabel *currentTerm;

- (void)updateView;

- (IBAction)clearPressed:(id)sender;
- (IBAction)sqrtPressed:(id)sender;
- (IBAction)multiPressed:(id)sender;
- (IBAction)diviPressed:(id)sender;
- (IBAction)plusPressed:(id)sender;
- (IBAction)minusPressed:(id)sender;

- (IBAction)equalPressed:(id)sender;

- (IBAction)posNegPressed:(id)sender;
- (IBAction)decimalPressed:(id)sender;

- (IBAction)zeroPressed:(id)sender;
- (IBAction)onePressed:(id)sender;
- (IBAction)twoPressed:(id)sender;
- (IBAction)threePressed:(id)sender;
- (IBAction)fourPressed:(id)sender;
- (IBAction)fivePressed:(id)sender;
- (IBAction)sixPressed:(id)sender;
- (IBAction)sevenPressed:(id)sender;
- (IBAction)eightPressed:(id)sender;
- (IBAction)ninePressed:(id)sender;

@end
