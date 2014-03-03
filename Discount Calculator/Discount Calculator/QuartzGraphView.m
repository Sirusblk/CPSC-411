//
//  QuartzGraphView.m
//  Discount Calculator
//
//  Created by David McLaren on 3/2/14.
//  Copyright (c) 2014 David McLaren. All rights reserved.
//

#import "QuartzGraphView.h"
#import "CalculatorData.h"
#import "GraphViewController.h"
#import <QuartzCore/QuartzCore.h>

@implementation QuartzGraphView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    GraphViewController *secondViewController = [[GraphViewController alloc] init];
    float originalPrice = secondViewController.userData.originalPrice;
    float discountedPrice = secondViewController.userData.discountedPrice;
    float discount = originalPrice - discountedPrice;
    float percent = discount/originalPrice;
    NSLog(@"OriginalPrice: %f", originalPrice);
    NSLog(@"Percent: %f", percent);
    
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //Total Price Bar
    //Green Color Fill
    CGContextSetRGBFillColor(context, 0.412, 0.545, 0.443, 1.0);
    //Left Most Bar
    CGContextFillRect(context, CGRectMake(20.0, 80.0, 140.0, 335.0));
    
    //DiscountedPrice Price Bar
    //Green Color Fill
    CGContextSetRGBFillColor(context, 0.957, 0.918, 0.549, 1.0);
    //Left Most Bar
    CGContextFillRect(context, CGRectMake(160.0, 80.0, 140.0, 335.0));
    
    //Discount Price Bar
    //Green Color Fill
    CGContextSetRGBFillColor(context, 0.447, 0.314, 0.329, 1.0);
    //Left Most Bar
    CGContextFillRect(context, CGRectMake(20.0, 80.0, 140.0, (335.0 * percent)));
}

@end
