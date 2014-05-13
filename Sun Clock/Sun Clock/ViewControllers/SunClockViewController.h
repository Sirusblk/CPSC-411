//
//  SunClockViewController.h
//  Sun Clock
//
//  Created by David McLaren on 4/27/14.
//  Copyright (c) 2014 David McLaren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SunClockData.h"
#import "SunClockView.h"

@interface SunClockViewController : UIViewController

@property SunClockData *sunClock;
@property double latitude;
@property double longitude;
@property (weak, nonatomic) IBOutlet UILabel *DawnValue;
@property (weak, nonatomic) IBOutlet UILabel *DuskValue;
@property (weak, nonatomic) IBOutlet UILabel *RiseValue;
@property (weak, nonatomic) IBOutlet UILabel *SetValue;

-(void) updateLable;
-(double) getHours:(NSDate *) input;
-(double) getMinutes:(NSDate *) input;

@end
