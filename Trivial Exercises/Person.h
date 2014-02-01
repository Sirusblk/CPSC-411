//
//  Person.h
//  Trivial Exercises
//
//  Created by David McLaren on 1/30/14.
//  Copyright (c) 2014 David McLaren. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
	NSString *_firstName;
	NSNumber *_zipCode;
}

@property (nonatomic, retain) NSString* firstName;
@property (nonatomic, retain) NSNumber* zipCode;

//Init function
-(id) initWithFirstName:(NSString *) inputFirstName ZipCode:(NSNumber *) inputZipCode;

@end
