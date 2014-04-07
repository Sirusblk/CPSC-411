//
//  DetailView.h
//  Mass Transit
//
//  Created by David McLaren on 4/6/14.
//  Copyright (c) 2014 David McLaren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface DetailView : UIView

@property NSString* headerColor;

-(double) redColorFromHexString:(NSString*)hexInput;
-(double) greenColorFromHexString:(NSString*)hexInput;
-(double) blueColorFromHexString:(NSString*)hexInput;

@end
