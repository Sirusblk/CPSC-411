//
//  main.m
//  Final Review
//
//  Created by David McLaren on 5/15/14.
//  Copyright (c) 2014 David McLaren. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "camelCaseString.h"
#import "Thing.h"

int main(void){
    @autoreleasepool{
        NSString *s = @"smashed , squashed , and splattered";
        s = [s camelCaseString];
        printf("%s\n", [s UTF8String]);
        
        Thing* myThing = [[Thing alloc] init];
        myThing.num = @3.1416;
        Thing* myCopy = [myThing copy];
        printf("%s\n", [[myCopy formattedString] UTF8String]);
        
        return 0;
    }
}
