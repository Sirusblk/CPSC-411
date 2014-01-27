//
//  main.m
//  Trivial Exercises
//
//  Created by David McLaren on 1/26/14.
//  Copyright (c) 2014 David McLaren. All rights reserved.
//

#import <Foundation/Foundation.h>

//Prototypes
void primeNumber(int);
bool isPrime(int);

//Main
int main(int argc, const char * argv[])
{

	@autoreleasepool {
	    primeNumber(10001);
	    
	}
    return 0;
}

void primeNumber(int maxCount)
{
	NSLog(@"Entered Prime Number Function");
	
	//Variables
	int num = 3;
	
	// Loop through until chosen prime is reached
	for (int i = 1; i <= maxCount; ) {
		// If it is prime, increase the count for prime number
		if (isPrime(num)) {
			printf("%d\n", num);
			i++;
		}
		
		num++;
	}
	
	num--;
	printf("The %dst prime number is: %d\n", maxCount, num);
}

// Only checks numbers 2 or greater!
bool isPrime(int input)
{
	//Variables
	double check = sqrt(input + 1);
	// Only need to check square root!
	
	for (int i = 2; i < check; i++) {
		if (input%i == 0) {
			return false;
		}
	}
	
	return true;
}
