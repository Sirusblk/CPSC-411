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
@synthesize decimal;
@synthesize negative;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    pastTerm.text = @"";
    opTerm.text = @"";
    currentTerm.text = @"0";
    decimal = false;
    negative = false;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clearPressed:(id)sender {
    //Reset userData
    pastTerm.text = @"";
    opTerm.text = @"";
    currentTerm.text = @"0";
}

- (float)equation:(NSString *)opCode {
    float result = 0;
    
    if ([opCode isEqualToString:@"×"]) {
        result = [pastTerm.text floatValue] * [currentTerm.text floatValue];
    } else if ([opCode isEqualToString:@"÷"]) {
        result = [pastTerm.text floatValue] / [currentTerm.text floatValue];
    } else if ([opCode isEqualToString:@"+"]) {
        result = [pastTerm.text floatValue] + [currentTerm.text floatValue];
    } else if ([opCode isEqualToString:@"-"]) {
        result = [pastTerm.text floatValue] - [currentTerm.text floatValue];
    } else {
        NSLog(@"%@", @"ERROR: Unexpected Operator!");
    }
    
    return result;
}

//Operators
- (IBAction)multiPressed:(id)sender {
    if ([opTerm.text isEqualToString:@""]) {
        pastTerm.text = currentTerm.text;
        opTerm.text = @"×";
        currentTerm.text = @"0";
    } else {
        float temp = [self equation:opTerm.text];
        pastTerm.text = [NSString stringWithFormat:@"%g", temp];
        opTerm.text = @"×";
        currentTerm.text = @"0";
    }
}

- (IBAction)diviPressed:(id)sender {
    if ([opTerm.text isEqualToString:@""]) {
        pastTerm.text = currentTerm.text;
        opTerm.text = @"÷";
        currentTerm.text = @"0";
    } else {
        float temp = [self equation:opTerm.text];
        pastTerm.text = [NSString stringWithFormat:@"%g", temp];
        opTerm.text = @"÷";
        currentTerm.text = @"0";
    }
}

- (IBAction)plusPressed:(id)sender {
    if ([opTerm.text isEqualToString:@""]) {
        pastTerm.text = currentTerm.text;
        opTerm.text = @"+";
        currentTerm.text = @"0";
    } else {
        float temp = [self equation:opTerm.text];
        pastTerm.text = [NSString stringWithFormat:@"%g", temp];
        opTerm.text = @"+";
        currentTerm.text = @"0";
    }
}

- (IBAction)minusPressed:(id)sender {
    if ([opTerm.text isEqualToString:@""]) {
        pastTerm.text = currentTerm.text;
        opTerm.text = @"-";
        currentTerm.text = @"0";
    } else {
        float temp = [self equation:opTerm.text];
        pastTerm.text = [NSString stringWithFormat:@"%g", temp];
        opTerm.text = @"-";
        currentTerm.text = @"0";
    }
}

- (IBAction)equalPressed:(id)sender {
    if (![opTerm.text isEqualToString:@""]) {
        float temp = [self equation:opTerm.text];
        currentTerm.text = [NSString stringWithFormat:@"%g", temp];
        opTerm.text = @"";
        pastTerm.text = @"";
    }
}

//Modifiers
- (IBAction)sqrtPressed:(id)sender {
    if (![currentTerm.text isEqualToString:@"0"]) {
        double temp = [currentTerm.text doubleValue];
        temp = sqrt(temp);
        currentTerm.text = [NSString stringWithFormat: @"%g", temp];
    }
}

- (IBAction)posNegPressed:(id)sender {
    if (![currentTerm.text isEqualToString:@"0"]) {
        if (negative == false) {
            NSString *temp = @"-";
            temp = [temp stringByAppendingString:currentTerm.text];
            currentTerm.text = temp;
            negative = true;
        } else {
            currentTerm.text = [currentTerm.text substringFromIndex:1];
            negative = false;
        }
    }
}

- (IBAction)decimalPressed:(id)sender {
    if (decimal == false) {
        currentTerm.text = [currentTerm.text stringByAppendingFormat:@"%@", @"."];
        decimal = true;
    }
}

//Digits
- (IBAction)zeroPressed:(id)sender {
    if (![currentTerm.text isEqualToString:@"0"]) {
        currentTerm.text = [currentTerm.text stringByAppendingFormat:@"%@", @"0"];
    }
}

- (IBAction)onePressed:(id)sender {
    if ([currentTerm.text isEqualToString:@"0"]) {
        currentTerm.text = @"1";
    } else {
        currentTerm.text = [currentTerm.text stringByAppendingFormat:@"%@", @"1"];
    }
}

- (IBAction)twoPressed:(id)sender {
    if([currentTerm.text isEqualToString:@"0"]) {
        currentTerm.text = @"2";
    } else {
        currentTerm.text = [currentTerm.text stringByAppendingFormat:@"%@", @"2"];
    }
}

- (IBAction)threePressed:(id)sender {
    if([currentTerm.text isEqualToString:@"0"]) {
        currentTerm.text = @"3";
    } else {
        currentTerm.text = [currentTerm.text stringByAppendingFormat:@"%@", @"3"];
    }
}

- (IBAction)fourPressed:(id)sender {
    if([currentTerm.text isEqualToString:@"0"]) {
        currentTerm.text = @"4";
    } else {
        currentTerm.text = [currentTerm.text stringByAppendingFormat:@"%@", @"4"];
    }
}

- (IBAction)fivePressed:(id)sender {
    if ([currentTerm.text isEqualToString:@"0"]) {
        currentTerm.text = @"5";
    } else {
        currentTerm.text = [currentTerm.text stringByAppendingFormat:@"%@", @"5"];
    }
}

- (IBAction)sixPressed:(id)sender {
    if ([currentTerm.text isEqualToString:@"0"]) {
        currentTerm.text = @"6";
    } else {
        currentTerm.text = [currentTerm.text stringByAppendingFormat:@"%@", @"6"];
    }
}

- (IBAction)sevenPressed:(id)sender {
    if ([currentTerm.text isEqualToString:@"0"]) {
        currentTerm.text = @"7";
    } else {
        currentTerm.text = [currentTerm.text stringByAppendingFormat:@"%@", @"7"];
    }
}

- (IBAction)eightPressed:(id)sender {
    if ([currentTerm.text isEqualToString:@"0"]) {
        currentTerm.text = @"8";
    } else {
        currentTerm.text = [currentTerm.text stringByAppendingFormat:@"%@", @"8"];
    }
}

- (IBAction)ninePressed:(id)sender {
    if ([currentTerm.text isEqualToString:@"0"]) {
        currentTerm.text = @"9";
    } else {
        currentTerm.text = [currentTerm.text stringByAppendingFormat:@"%@", @"9"];
    }
}
@end
