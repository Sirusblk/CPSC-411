//
//  CalculatorData.h
//  Discount Calculator
//
//  Created by David McLaren on 2/28/14.
//  Copyright (c) 2014 David McLaren. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorData : NSObject
@property float price;
@property int dollarsOff;
@property int discount;
@property int additionalDiscount;
@property float tax;
@property (readonly) float discountedPrice;
@property (readonly) float originalPrice;

-(id) initWithData:(float) _price dollarsOff:(int) _dollarsOff discount:(int) _discount additionalDiscount:(int) _additionalDiscount tax:(float) _tax;
-(float) discountedPrice;
-(float) originalPrice;
+(CalculatorData*) mainPrice;
@end
