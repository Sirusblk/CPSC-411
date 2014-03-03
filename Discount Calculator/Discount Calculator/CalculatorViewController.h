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
@property (weak, nonatomic) IBOutlet UITextField *priceTextField;
@property (weak, nonatomic) IBOutlet UITextField *flatDollarsOffTextField;
@property (weak, nonatomic) IBOutlet UITextField *percentDiscountTextField;
@property (weak, nonatomic) IBOutlet UITextField *otherPercentTextField;
@property (weak, nonatomic) IBOutlet UITextField *taxTextField;
@property (weak, nonatomic) IBOutlet UILabel *originalPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *discountPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *errorLabel;

- (IBAction)calculateButtonPressed:(id)sender;
- (void) updateView;
@end
