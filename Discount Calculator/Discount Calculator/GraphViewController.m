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
	// Do any additional setup after loading the view.
    
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
