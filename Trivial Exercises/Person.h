//
//  Person.h
//  Trivial Exercises
//
//  Created by David McLaren on 1/30/14.
//  Copyright (c) 2014 David McLaren. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property NSString* _fullName;
@property NSNumber* _zipCode;

//Init function
-(id) initWithFullName:(NSString*) fullName LastName:(NSString*) zipCode;

//Accessor Functions
-(NSString*) fullName;
-(NSNumber*) zipCode;

//Set functions
-(void) setName:(NSString*) fullName;
-(void) setZip:(NSNumber*) zipCode;

@end
