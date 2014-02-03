//
//  Person.m
//  Trivial Exercises
//
//  Created by David McLaren on 1/30/14.
//  Copyright (c) 2014 David McLaren. All rights reserved.
//

#import "Person.h"

@implementation Person
@synthesize firstName = _fullName;
@synthesize zipCode = _zipCode;

-(id) initWithFirstName:(NSString *) inputFirstName ZipCode:(NSNumber *) inputZipCode
{
	self = [super init];	//init parent class
	
	if (self) {
		_fullName = inputFirstName;
		_zipCode = inputZipCode;
	}
	
	return self;
}

/*
- (NSString *) fullName
{
	return _fullName;
}

- (NSNumber *) zipCode
{
	return _zipCode;
}
 */

@end
