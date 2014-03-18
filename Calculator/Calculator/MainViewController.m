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
@synthesize userData;

//@synthesize currentTermString;
//@synthesize lastTermString;

@synthesize pastTerm;
@synthesize opTerm;
@synthesize currentTerm;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Setup Data Model
    userData = [[CalculatorData alloc] init];
    //currentTermString = [[NSMutableString alloc] init];
    //lastTermString = [[NSMutableString alloc] init];
    
    //[currentTermString setString:@"0"];
    //[lastTermString setString:@""];
    
	// Remove placement text
    [self updateView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateData
{
    NSLog(@"%f", [self.pastTerm.text floatValue]);
    
    if (![pastTerm.text isEqualToString:@""]) {
        userData.lastTerm = [self.pastTerm.text floatValue];
    }
    
    NSLog(@"%f", [self.currentTerm.text floatValue]);
    
    if (![currentTerm.text isEqualToString:@"0"]) {
        userData.currentTerm = [self.currentTerm.text floatValue];
    }
}

- (void)updateView
{
    if (userData.lastTerm == 0) {
        self.pastTerm.text = @"";
    } else {
        self.pastTerm.text = [userData getLastTerm];
    }
    
    self.opTerm.text = userData.opCommand;
    self.currentTerm.text = [userData getCurrentTerm];
}

- (IBAction)clearPressed:(id)sender {
    //Reset userData
    pastTerm.text = @"";
    currentTerm.text = @"0";
    //userData.opCommand = @"";
    
    //userData.lastTerm = 0;
    //userData.currentTerm = 0;
    
    //Update Display
    [self updateView];
}

//Operators
- (IBAction)multiPressed:(id)sender {

    //Check if Operator field is not empty
    if (![userData.opCommand isEqual:@""]) {
        [userData calculate];
        userData.opCommand = @"x";
        self.currentTerm.text = @"0";
        userData.currentTerm = 0;
    } else {
        //Is empty, so
        //Shift everything!
        self.pastTerm.text = [userData getCurrentTerm];
        userData.opCommand = @"x";
        self.opTerm.text = @"x";
    }
    
    /*
    //As long as the field is not empty, grab the string and convert to float
    if (![lastTermString isEqualToString:@""]) {
        userData.lastTerm = [currentTermString floatValue];
    }
     */
    
    [self updateData];
    
    //Update Display
    //[self updateView];
    pastTerm.text = currentTerm.text;
    currentTerm.text = @"0";
    userData.currentTerm = 0;
}

- (IBAction)diviPressed:(id)sender {
    //Check if Operator field is not empty
    if (![userData.opCommand isEqual:@""]) {
        [userData calculate];
        //userData.opCommand = @"÷";
        self.currentTerm.text = @"0";
        //userData.currentTerm = 0;
    } else {
        //Is empty, so
        //Shift everything!
        self.pastTerm.text = [userData getCurrentTerm];
        //userData.opCommand = @"÷";
        self.opTerm.text = @"÷";
    }
    
    [self updateData];
    
    //Update Display
    //[self updateView];
    pastTerm.text = currentTerm.text;
    currentTerm.text = @"0";
    userData.currentTerm = 0;
}

- (IBAction)plusPressed:(id)sender {
    [self updateData];
    
    if (![pastTerm.text isEqualToString:@""]) {
        userData.lastTerm = [pastTerm.text floatValue];
    }
    
    //Update Display
    [self updateView];
}

- (IBAction)minusPressed:(id)sender {
    [self updateData];
    
    if (![pastTerm.text isEqualToString:@""]) {
        userData.lastTerm = [currentTerm.text floatValue];
    }
    
    //Update Display
    [self updateView];
}

- (IBAction)equalPressed:(id)sender {
    [self updateData];
    
    if (![pastTerm.text isEqualToString:@""]) {
        [userData calculate];
        //userData.lastTerm = [userData.currentTermString floatValue];
    }
    
    //Update Display
    [self updateView];
}

//Modifiers
- (IBAction)sqrtPressed:(id)sender {
    [self updateData];
    NSLog(@"Last Term: %f", userData.lastTerm);
    NSLog(@"Current Term: %f", userData.currentTerm);
    NSLog(@"Operator: %@", userData.opCommand);
    
    NSLog(@"%.f", sqrt(userData.currentTerm));
    userData.currentTerm = sqrt(userData.currentTerm);
    
    //Update Display
    [self updateView];
}

- (IBAction)posNegPressed:(id)sender {
}

- (IBAction)decimalPressed:(id)sender {
    if (![self.currentTerm.text isEqualToString:@"0"]) {
        NSMutableString *temp = [[NSMutableString alloc] initWithFormat:@"%@", self.currentTerm.text];
        [temp appendString:@"."];
        self.currentTerm.text = temp;
    } else {
        self.currentTerm.text = @".";
    }
}

//Digits
- (IBAction)zeroPressed:(id)sender {
    //Current term is not 0, so append
    if (![self.currentTerm.text isEqual: @"0"]) {
        NSMutableString *temp = [[NSMutableString alloc] initWithFormat:@"%@", self.currentTerm.text];
        [temp appendString:@"0"];
        self.currentTerm.text = temp;
    }
}

- (IBAction)onePressed:(id)sender {
    //Current term is not 0, so append
    NSLog(@"Blah:%@", self.currentTerm.text);
    if (![self.currentTerm.text isEqualToString:@"0"]) {
        NSMutableString *temp = [[NSMutableString alloc] initWithFormat:@"%@", self.currentTerm.text];
        [temp appendString:@"1"];
        self.currentTerm.text = temp;
    } else {
        self.currentTerm.text = @"1";
    }
}

- (IBAction)twoPressed:(id)sender {
    if (![self.currentTerm.text isEqualToString: @"0"]) {
        NSMutableString *temp = [[NSMutableString alloc] initWithFormat:@"%@", self.currentTerm.text];
        [temp appendString:@"2"];
        self.currentTerm.text = temp;
    } else {
        self.currentTerm.text = @"2";
    }
}

- (IBAction)threePressed:(id)sender {
    //This always appends for some reason.
    if (![self.currentTerm.text isEqualToString:@"0"]) {
        NSMutableString *temp = [[NSMutableString alloc] initWithFormat:@"%@", self.currentTerm.text];
        [temp appendString:@"3"];
        self.currentTerm.text = temp;
    } else {
        self.currentTerm.text = @"3";
    }
}

- (IBAction)fourPressed:(id)sender {
    if (![self.currentTerm.text isEqualToString:@"0"]) {
        NSMutableString *temp = [[NSMutableString alloc] initWithFormat:@"%@", self.currentTerm.text];
        [temp appendString:@"4"];
        self.currentTerm.text = temp;
    } else {
        self.currentTerm.text = @"4";
    }
}

- (IBAction)fivePressed:(id)sender {
    if (![self.currentTerm.text isEqualToString:@"0"]) {
        NSMutableString *temp = [[NSMutableString alloc] initWithFormat:@"%@", self.currentTerm.text];
        [temp appendString:@"5"];
        self.currentTerm.text = temp;
    } else {
        self.currentTerm.text = @"5";
    }
}

- (IBAction)sixPressed:(id)sender {
    if (![self.currentTerm.text isEqualToString:@"0"]) {
        NSMutableString *temp = [[NSMutableString alloc] initWithFormat:@"%@", self.currentTerm.text];
        [temp appendString:@"6"];
        self.currentTerm.text = temp;
    } else {
        self.currentTerm.text = @"6";
    }
}

- (IBAction)sevenPressed:(id)sender {
    if (![self.currentTerm.text isEqualToString:@"0"]) {
        NSMutableString *temp = [[NSMutableString alloc] initWithFormat:@"%@", self.currentTerm.text];
        [temp appendString:@"7"];
        self.currentTerm.text = temp;
    } else {
        self.currentTerm.text = @"7";
    }
}

- (IBAction)eightPressed:(id)sender {
    if (![self.currentTerm.text isEqualToString:@"0"]) {
        NSMutableString *temp = [[NSMutableString alloc] initWithFormat:@"%@", self.currentTerm.text];
        [temp appendString:@"8"];
        self.currentTerm.text = temp;
    } else {
        self.currentTerm.text = @"8";
    }
}

- (IBAction)ninePressed:(id)sender {
    if (![self.currentTerm.text isEqualToString:@"0"]) {
        NSMutableString *temp = [[NSMutableString alloc] initWithFormat:@"%@", self.currentTerm.text];
        [temp appendString:@"9"];
        self.currentTerm.text = temp;
    } else {
        self.currentTerm.text = @"9";
    }
}
@end
