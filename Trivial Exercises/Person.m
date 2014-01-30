//
//  Person.m
//  Trivial Exercises
//
//  Created by David McLaren on 1/30/14.
//  Copyright (c) 2014 David McLaren. All rights reserved.
//

#import "Person.h"

@implementation Person
-(id) initWithFullName:(NSString *)fullName LastName:(NSString *)zipCode
{
	self = [super init];	//init parent class
	
	if (self) {
		_fullName = [fullName retain];
		_zipCode = [zipCode retain];
	}
}

@end
