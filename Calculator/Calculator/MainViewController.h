//
//  MainViewController.h
//  Calculator
//
//  Created by David McLaren on 3/14/14.
//  Copyright (c) 2014 David McLaren. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *pastTerm;
@property (weak, nonatomic) IBOutlet UILabel *opTerm;
@property (weak, nonatomic) IBOutlet UILabel *currentTerm;

@property (weak, nonatomic) IBOutlet UIButton *allClear;
@property (weak, nonatomic) IBOutlet UIButton *squareRoot;
@property (weak, nonatomic) IBOutlet UIButton *multiplyOp;
@property (weak, nonatomic) IBOutlet UIButton *divideOp;
@property (weak, nonatomic) IBOutlet UIButton *plusOp;
@property (weak, nonatomic) IBOutlet UIButton *subtractOp;
@property (weak, nonatomic) IBOutlet UIButton *equalEval;

@property (weak, nonatomic) IBOutlet UIButton *posOrNeg;

@property (weak, nonatomic) IBOutlet UIButton *decimal;
@property (weak, nonatomic) IBOutlet UIButton *zeroDigit;
@property (weak, nonatomic) IBOutlet UIButton *oneDigit;
@property (weak, nonatomic) IBOutlet UIButton *twoDigit;
@property (weak, nonatomic) IBOutlet UIButton *threeDigit;
@property (weak, nonatomic) IBOutlet UIButton *fourDigit;
@property (weak, nonatomic) IBOutlet UIButton *fiveDigit;
@property (weak, nonatomic) IBOutlet UIButton *sixDigit;
@property (weak, nonatomic) IBOutlet UIButton *sevenDigit;
@property (weak, nonatomic) IBOutlet UIButton *eightDigit;
@property (weak, nonatomic) IBOutlet UIButton *nineDigit;

@end
