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
@synthesize DawnValue;
@synthesize RiseValue;
@synthesize SetValue;
@synthesize DuskValue;

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
    
    [self updateLable:DawnValue WithSource:[sunClock dawn]];
    [self updateLable:RiseValue WithSource:[sunClock sunrise]];
    [self updateLable:SetValue WithSource:[sunClock sunset]];
    [self updateLable:DuskValue WithSource:[sunClock dusk]];
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

-(void) updateLable:(UILabel*) input WithSource:(NSDate*) source
{
    double hours = [self getHours:source];
    double mins = [self getMinutes:source];
    NSString *type = @"AM";
    
    if (hours > 12) {
        hours -= 12;
        type = @"PM";
    }
    
    [input setText:[NSString stringWithFormat:@"%.0f:%.0f %@", hours, mins, type]];
}

-(double) getHours:(NSDate *) input
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    [calendar setTimeZone: [NSTimeZone systemTimeZone]];
    NSDateComponents *components = [calendar components:(NSHourCalendarUnit | NSMinuteCalendarUnit) fromDate:input];
    NSNumber *hours = [NSNumber numberWithUnsignedInteger:[components hour]];
    return [hours doubleValue];
}

-(double) getMinutes:(NSDate *) input
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    [calendar setTimeZone: [NSTimeZone systemTimeZone]];
    NSDateComponents *components = [calendar components:(NSHourCalendarUnit | NSMinuteCalendarUnit) fromDate:input];
    NSNumber *mins = [NSNumber numberWithUnsignedInteger:[components minute]];
    return [mins doubleValue];
}

@end
