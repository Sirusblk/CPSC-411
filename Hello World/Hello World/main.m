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
		printf("Please enter in a message:\n");
		
		// Doesn't quite work, can't tell end of input
		/*
		NSFileHandle *console = [NSFileHandle fileHandleWithStandardInput];
		NSData *inputData = [NSData dataWithData:[console readDataToEndOfFile]];
		NSString *inputString = [[NSString alloc] initWithData:inputData encoding:NSUTF8StringEncoding];
		 */
		
		//NSString *inputString = scanf(@"%@", inputString);
		
		// Spit out a UTF-8 formated string using printf (stdout)
		//printf("%s", [inputString UTF8String]);
		
		// Output current date and time - WORKS!
		NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
		[dateFormat setDateFormat:@"MM/dd/yyyy, HH:mm"];
		NSString *outputDate = [dateFormat stringFromDate:[NSDate date]];
		printf("%s", [outputDate UTF8String]);
		printf("\n");
	}
    return 0;
}

/*
 What is the name and version of the compiler used?		Clang LLVM (Apple's Version)
 Where is your project file and source code stored?		In my project folder...
 Where are the intermediate files stored?				(Object files, etc) By default not with everything else. /Users/.../Library/Developer/Xcode/Derived Data/
 Where is the application bundle stored?				Inside Application.app
 Where is the project's binary executable stored?		Inside the Application.app folder under MacOS
 */
