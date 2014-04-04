//
//  main.m
//  Mass Transit Terminal
//
//  Created by David McLaren on 4/4/14.
//  Copyright (c) 2014 David McLaren. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sqlite3.h"

// Prototypes
NSArray* fetchResults(sqlite3 *dataBase);


// Main
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        NSLog(@"Hello, World!");
        
    }
    return 0;
}

NSArray* fetchResults(sqlite3 *dataBase)
{
    NSMutableArray* results = [[NSMutableArray alloc] init];
    
    return (NSArray*)results;
}
