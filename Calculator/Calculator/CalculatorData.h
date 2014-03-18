//
//  CalculatorData.h
//  Calculator
//
//  Created by David McLaren on 3/17/14.
//  Copyright (c) 2014 David McLaren. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorData : NSObject
//@property NSMutableString *lastTermString;
//@property NSMutableString *currentTermString;
@property float lastTerm;
@property float currentTerm;
@property NSString *opCommand;

- (void)calculate;
- (NSString*)getLastTerm;
- (NSString*)getCurrentTerm;

@end
