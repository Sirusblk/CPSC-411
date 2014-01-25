//
//  main.m
//  Hello World
//
//  Created by David McLaren on 1/24/14.
//  Copyright (c) 2014 David McLaren. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

	@autoreleasepool {
	    printf("Please enter in a message:");
		
		// Idea from http://caiustheory.com/read-standard-input-using-objective-c
	    NSFileHandle *console = [NSFileHandle fileHandleWithStandardInput];
		NSData *inputData = [NSData dataWithData:[console readDataToEndOfFile]];
		NSString *inputString = [[NSString alloc] initWithData:inputData encoding:NSUTF8StringEncoding];
		
		// Spit out a UTF-8 formated string using printf (stdout)
		printf("%s", [inputString UTF8String]);
		
	    NSLog(@"Hello, World!");
	}
    return 0;
}

