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

@synthesize currentTermString;
@synthesize lastTermString;

@synthesize pastTerm;
@synthesize opTerm;
@synthesize currentTerm;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Setup Data Model
    userData = [[CalculatorData alloc] init];
    currentTermString = [[NSMutableString alloc] init];
    lastTermString = [[NSMutableString alloc] init];
    
    [currentTermString setString:@"0"];
    [lastTermString setString:@""];
    
	// Remove placement text
    [self updateView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    [lastTermString setString:@""];
    [currentTermString setString:@"0"];
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
        currentTerm.text = @"0";
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
    
    //Update Display
    [self updateView];
}

- (IBAction)diviPressed:(id)sender {
    //Check if Operator field is empty or not
    if (![userData.opCommand isEqual:@""]) {
        [userData calculate];
    } else {
        //Shift everything
        self.pastTerm.text = [userData getCurrentTerm];
        userData.opCommand = @"÷";
        self.opTerm.text = @"÷";
    }
    
    //Update Display
    [self updateView];
}

- (IBAction)plusPressed:(id)sender {
    if (![lastTermString isEqualToString:@""]) {
        userData.lastTerm = [currentTermString floatValue];
    }
    
    //Update Display
    [self updateView];
}

- (IBAction)minusPressed:(id)sender {
    if (![lastTermString isEqualToString:@""]) {
        userData.lastTerm = [currentTermString floatValue];
    }
    
    //Update Display
    [self updateView];
}

- (IBAction)equalPressed:(id)sender {
    float temp;
    
    if (![lastTermString isEqualToString:@""]) {
        [userData calculate];
        //userData.lastTerm = [userData.currentTermString floatValue];
    }
    
    //Update Display
    //[self updateView];
}

//Modifiers
- (IBAction)sqrtPressed:(id)sender {
    userData.currentTerm = sqrt(userData.currentTerm);
    
    //Update Display
    [self updateView];
}

- (IBAction)posNegPressed:(id)sender {
}

- (IBAction)decimalPressed:(id)sender {
}

//Digits
- (IBAction)zeroPressed:(id)sender {
    if (![self.currentTerm.text isEqual: @"0"]) {
        NSMutableString *temp = [[NSMutableString alloc] initWithFormat:@"%@", self.currentTerm.text];
        [temp appendString:@"0"];
        self.currentTerm.text = temp;
    }
}

- (IBAction)onePressed:(id)sender {
    if (![self.currentTerm.text isEqual: @"0"]) {
        NSMutableString *temp = [[NSMutableString alloc] initWithFormat:@"%@", self.currentTerm.text];
        [temp appendString:@"1"];
        self.currentTerm.text = temp;
    } else {
        self.currentTerm.text = @"1";
    }
}

- (IBAction)twoPressed:(id)sender {
    if (![self.currentTerm.text isEqual: @"0"]) {
        NSMutableString *temp = [[NSMutableString alloc] initWithFormat:@"%@", self.currentTerm.text];
        [temp appendString:@"2"];
        self.currentTerm.text = temp;
    } else {
        self.currentTerm.text = @"2";
    }
}

- (IBAction)threePressed:(id)sender {
}

- (IBAction)fourPressed:(id)sender {
}

- (IBAction)fivePressed:(id)sender {
}

- (IBAction)sixPressed:(id)sender {
}

- (IBAction)sevenPressed:(id)sender {
}

- (IBAction)eightPressed:(id)sender {
}

- (IBAction)ninePressed:(id)sender {
}
@end
