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
	
    float price = [userData price];
    float discount = [userData discountedPrice];
    float discountPercent = ([userData discountedPrice] / [userData price]) * 100;
    float savings = price - discount;
    float savingsPerscent = (100 - discountPercent);
    
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", price];
    self.discountAmountLabel.text = [NSString stringWithFormat:@"$%.2f", discount];
    self.discountPercentLabel.text = [NSString stringWithFormat:@"%.f%%", discountPercent];
    self.saleAmountLabel.text = [NSString stringWithFormat:@"$%.2f", savings];
    self.salePercentLabel.text = [NSString stringWithFormat:@"%.f%%",savingsPerscent];
    
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
    [self.navigationController popViewControllerAnimated:YES];
    NSLog(@"Popping!");
}

@end
