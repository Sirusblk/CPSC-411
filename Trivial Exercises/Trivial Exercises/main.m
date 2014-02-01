//
//  main.m
//  Trivial Exercises
//
//  Created by David McLaren on 1/26/14.
//  Copyright (c) 2014 David McLaren. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

//Prototypes
void primeNumber(int);
bool isPrime(int);
void sumOfMultiples(int, int, int);
void listDiff(NSString *, NSString *);
void sortList(NSArray *);
void inputPerson();

//Main
int main(int argc, const char * argv[])
{

	@autoreleasepool {
	    //primeNumber(10001);
	    //sumOfMultiples(1000, 3, 5);
		//listDiff(@"impiety", @"megaloblastic");
		inputPerson();
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
			i++;
		}
		
		num++;
	}
	
	num--;
	printf("The %dst prime number is: %d\n", maxCount, num);
}

///////////////////
// Sub-Functions //
///////////////////

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

void sumOfMultiples(int upperBound, int numA, int numB)
{
	NSLog(@"Entered Sum of Multiples Function");
	
	//Variables
	int total = 0;
	
	//Loop
	for(int i = 0; i < upperBound; i++)
	{
		if(i % numA == 0)
			total += i;
		else if(i % numB == 0)
			total += i;
	}
	
	printf("The sum of all multiples of %d  and %d under %d is: %d\n", numA, numB, upperBound, total);
}

void listDiff(NSString *wordA, NSString *wordB)
{
	
	//NSLog(@"%@", wordArray);
}

void sortList(NSArray *inputArray)
{
	//Quick Sort here...
}

void inputPerson()
{
	//Variables
	char str[256];
	int number;
	NSString *inputName = [[NSString alloc] init];
	NSNumber *inputZip = [[NSNumber alloc] init];
	Person *inputPerson = [[Person alloc] init];
	NSMutableArray *personArray;
	
	//Loop
	do {
		printf("Please input a person's first name followed by their zip code: ");
		scanf("%s %d", str, &number);
		
		inputName = [NSString stringWithUTF8String:str];
		inputZip = [NSNumber numberWithInt:number];
		
		[inputPerson setFirstName:inputName];
		[inputPerson setZipCode:inputZip];
		
		[personArray addObject:inputPerson];
		
		printf("\nPerson Added! Add another. To quit press Control+D\n");
	} while (!feof(stdin));
	
	printf("\n====================================================\n\n");
	
}
