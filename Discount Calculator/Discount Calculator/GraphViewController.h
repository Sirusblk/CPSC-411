//
//  GraphViewController.h
//  Discount Calculator
//
//  Created by David McLaren on 2/27/14.
//  Copyright (c) 2014 David McLaren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalculatorData.h"
#import "QuartzGraphView.h"

@interface GraphViewController : UIViewController
@property CalculatorData* userData;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UILabel *discountAmountLabel;
@property (weak, nonatomic) IBOutlet UILabel *discountPercentLabel;
@property (weak, nonatomic) IBOutlet UILabel *saleAmountLabel;
@property (weak, nonatomic) IBOutlet UILabel *salePercentLabel;
@end
