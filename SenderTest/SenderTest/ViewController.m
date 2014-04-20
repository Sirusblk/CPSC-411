//
//  ViewController.m
//  SenderTest
//
//  Created by David McLaren on 4/17/14.
//  Copyright (c) 2014 David McLaren. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPress:(id)sender {
    UIButton * button = (UIButton*) sender;
    
    if (button.tag == 0) {
        NSLog(@"Hello World!");
    } else if (button.tag == 1) {
        NSLog(@"Goodbye World...");
    }
}
@end
