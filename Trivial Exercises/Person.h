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
	NSString *_fullName;
	NSNumber *_zipCode;
}

@property (nonatomic, retain) NSString* fullName;
@property (nonatomic, retain) NSNumber* zipCode;

//Init function
-(id) initWithFullName:(NSString *) inputFullName ZipCode:(NSNumber *) inputZipCode;

@end
