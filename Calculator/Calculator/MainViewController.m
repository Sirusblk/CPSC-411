//
//  MainViewController.m
//  Calculator
//
//  Created by David McLaren on 3/14/14.
//  Copyright (c) 2014 David McLaren. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController
@synthesize pastTerm;
@synthesize opTerm;
@synthesize currentTerm;

@synthesize allClear;
@synthesize squareRoot;
@synthesize multiplyOp;
@synthesize divideOp;
@synthesize plusOp;
@synthesize subtractOp;
@synthesize equalEval;

@synthesize posOrNeg;

@synthesize decimal;
@synthesize zeroDigit;
@synthesize oneDigit;
@synthesize twoDigit;
@synthesize threeDigit;
@synthesize fourDigit;
@synthesize fiveDigit;
@synthesize sixDigit;
@synthesize sevenDigit;
@synthesize eightDigit;
@synthesize nineDigit;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Remove placement text
    self.pastTerm.text = @"";
    self.opTerm.text = @"";
    self.currentTerm.text = @"";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
