//
//  DMViewController.m
//  Hello Again
//
//  Created by David McLaren on 2/4/14.
//  Copyright (c) 2014 David McLaren. All rights reserved.
//

#import "DMViewController.h"

//Ignore this for now!
@interface DMViewController ()

@end

@implementation DMViewController

@synthesize myLabel;		//Needed for our label!
@synthesize myTextField;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	NSLog(@"My view did load!");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	[self.myTextField resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField*)sender
{
	NSLog(@"Putting away the keyboard.");
	[sender resignFirstResponder];
	return YES;
}

- (IBAction)buttonPressed:(id)sender
{
	NSLog(@"Button was touched!");
	/*
	NSString *t = self.myLabel.text;
	int x = [t intValue];
	x += 1;
	t = [NSString stringWithFormat:@"%d", x];
	self.myLabel.text = t;
	 */
	
	self.myLabel.text = self.myTextField.text;
}

@end
