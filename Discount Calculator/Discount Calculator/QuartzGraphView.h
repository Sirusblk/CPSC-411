//
//  QuartzGraphView.h
//  Discount Calculator
//
//  Created by David McLaren on 3/2/14.
//  Copyright (c) 2014 David McLaren. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuartzGraphView : UIView
@property float percentSavings;
@property float percentPaid;

- (void)setValues:(float)paid savings:(float)savings;
@end
