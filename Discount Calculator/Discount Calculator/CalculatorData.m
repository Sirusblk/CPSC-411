//
//  CalculatorData.m
//  Discount Calculator
//
//  Created by David McLaren on 2/28/14.
//  Copyright (c) 2014 David McLaren. All rights reserved.
//

#import "CalculatorData.h"

CalculatorData* _mainPrice;

@implementation CalculatorData
@synthesize price;
@synthesize dollarsOff;
@synthesize discount;
@synthesize additionalDiscount;
@synthesize tax;
@synthesize discountedPrice;
@synthesize originalPrice;

-(id) initWithData:(float)_price dollarsOff:(float)_dollarsOff discount:(float) _discount additionalDiscount:(float) _additionalDiscount tax:(float) _tax
{
    self = [super init];
    if(self) {
        price = _price;
        dollarsOff = _dollarsOff;
        discount = _discount;
        additionalDiscount = _additionalDiscount;
        tax = _tax;
    }
    return self;
}

-(float) discountedPrice
{
    return discountedPrice;
}

-(float) originalPrice
{
    return originalPrice;
}

+(CalculatorData*) mainPrice
{
    if (_mainPrice == nil) {
        _mainPrice = [[CalculatorData alloc] initWithData:36.99 dollarsOff:4.00 discount:10 additionalDiscount:5 tax:7.50];
    }
    return _mainPrice;
}

@end
