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
@property float dollarsOff;
@property float discount;
@property float additionalDiscount;
@property float tax;
@property (readonly) float discountedPrice;
@property (readonly) float originalPrice;

-(id) initWithData:(float) _price dollarsOff:(float) _dollarsOff discount:(float) _discount additionalDiscount:(float) _additionalDiscount tax:(float) _tax;
-(float) discountedPrice;
-(float) originalPrice;
+(CalculatorData*) mainPrice;
@end
