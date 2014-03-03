//
//  GraphViewController.m
//  Discount Calculator
//
//  Created by David McLaren on 2/27/14.
//  Copyright (c) 2014 David McLaren. All rights reserved.
//

#import "GraphViewController.h"

@interface GraphViewController ()

@end

@implementation GraphViewController
@synthesize userData;
@synthesize totalLabel;
@synthesize discountAmountLabel;
@synthesize discountPercentLabel;
@synthesize saleAmountLabel;
@synthesize salePercentLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    float price = [userData originalPrice];
    float discount = [userData discountedPrice];
    float discountPercent = ([userData discountedPrice] / [userData price]) * 100;
    float savings = price - discount;
    float savingsPercent = (100 - discountPercent);
    float position;
    
    //This is where the magic happens!
    [(QuartzGraphView*)self.view setValues:discountPercent savings:savingsPercent];
    
    self.totalLabel.textColor = [UIColor whiteColor];
    self.discountAmountLabel.textColor = [UIColor whiteColor];
    self.discountPercentLabel.textColor = [UIColor whiteColor];
    self.saleAmountLabel.textColor = [UIColor whiteColor];
    self.salePercentLabel.textColor = [UIColor whiteColor];
    
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", price];
    self.discountAmountLabel.text = [NSString stringWithFormat:@"$%.2f", discount];
    self.discountPercentLabel.text = [NSString stringWithFormat:@"%.f%%", discountPercent];
    self.saleAmountLabel.text = [NSString stringWithFormat:@"$%.2f", savings];
    self.salePercentLabel.text = [NSString stringWithFormat:@"%.f%%",savingsPercent];
    
    //Reposition Labels
    //!This only works with our View Controller Auto Layout left unchecked!
    //275 is the height of our green bar, offset by 90
    //Labels are 140 wide, 21 high
    //(335 / 2) - 21 + 90 = 236.5
    self.totalLabel.frame = CGRectMake(20.0, 236.5, 140.0, 21.0);
    position = (335 * (savingsPercent / 100) / 2) + 90 - 31.5;
    self.saleAmountLabel.frame = CGRectMake(160.0, position, 140.0, 21.0);
    position = (335 * (savingsPercent / 100) / 2) + 90 - 10.5;
    self.salePercentLabel.frame = CGRectMake(160.0, position, 140.0, 21.0);
    position = (275 - (275 * (discountPercent / 100) / 2)) + 90 + 10.5;
    self.discountAmountLabel.frame = CGRectMake(160.0, position, 140.0, 21.0);
    position = (275 - (275 * (discountPercent / 100) / 2)) + 90 + 31.5;
    self.discountPercentLabel.frame = CGRectMake(160.0, position, 140.0, 21.0);
    
    //Make Swipe Gesture
    UISwipeGestureRecognizer* swipeRightGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget: self action: @selector(handleSwipeRightFrom:)];
    swipeRightGestureRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer: swipeRightGestureRecognizer];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)handleSwipeRightFrom:(UIGestureRecognizer*)recognizer {
    // No need to save copy of userData to pass back to CalculatorViewController
    // since we were pushing and popping back. CalculatorViewController never
    // lost it's data!
    [self.navigationController popViewControllerAnimated:YES];
    NSLog(@"Popping!");
}

@end
