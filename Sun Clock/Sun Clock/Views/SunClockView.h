//
//  SunClockView.h
//  Sun Clock
//
//  Created by David McLaren on 4/27/14.
//  Copyright (c) 2014 David McLaren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SunClockData.h"

@interface SunClockView : UIView

@property NSDate *dawn;
@property NSDate *sunrise;
@property NSDate *sunset;
@property NSDate *dusk;

-(void) setDawn:(NSDate *) input_dawn Sunrise:(NSDate *) input_sunrise Sunset:(NSDate *) input_sunset Dusk:(NSDate *) input_dusk;

@end
