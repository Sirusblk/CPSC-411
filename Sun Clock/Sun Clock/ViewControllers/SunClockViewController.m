//
//  SunClockViewController.m
//  Sun Clock
//
//  Created by David McLaren on 4/27/14.
//  Copyright (c) 2014 David McLaren. All rights reserved.
//

#import "SunClockViewController.h"


@interface SunClockViewController ()

@end

@implementation SunClockViewController

@synthesize sunClock;

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"SunClockView loaded...");
    sunClock = [[SunClockData alloc] init];
    [sunClock updateDawn];
    [sunClock updateSunrise];
    [sunClock updateSunset];
    [sunClock updateDusk];
    
    [(SunClockView *)self.view setDawn:[sunClock dawn] Sunrise:[sunClock sunrise] Sunset:[sunClock sunset] Dusk:[sunClock dusk]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
