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
        
        /*
        //5
        NSArray *test_array = [@"Abazaba", @"Blabadaba"];
        n_mergesort(test_array, [test_array size], [test_array width], int (^n_cmp)(const void *, const void *))
        
        int (^n_cmp)(const void *, const void *) = ^int (const void *elem_a, const void *elem_b) {
            return 0;
        };
         */
        
        //6
        Thing *thing1 = [[Thing alloc] init];
        Thing *thing2 = [[Thing alloc] init];
        Thing *thing3 = [[Thing alloc] init];
        
        [thing1 setNum:@17];
        [thing2 setNum:@3.1417];
        [thing3 setNum:@42];
        
        NSArray *allTheThings = [NSArray arrayWithObjects:thing1, thing2, thing3, nil];
        NSArray *sorted = [allTheThings sortedArrayUsingComparator: ^NSComparisonResult(Thing *obj1, Thing *obj2) {
            if ([obj1.num doubleValue] > [obj2.num doubleValue]) {
                return 1;
            }
            else if ([obj1.num doubleValue] < [obj2.num doubleValue])
            {
                return -1;
            }
            return 0;
        }];
        
        NSLog(@"%@", [sorted[0] num]);
        NSLog(@"%@", [sorted[1] num]);
        NSLog(@"%@", [sorted[2] num]);
        
        //7
        void (^isWord)(id obj, NSUInteger idx, BOOL *stop) = ^void(id obj, NSUInteger idx, BOOL *stop) {
            if ([obj isEqual: @17]) {
                idx = 1;
            }
        };
        
        NSUInteger output;
        BOOL check = YES;
        
        isWord(allTheThings, output, &check);
        
        NSLog(@"%lu", (unsigned long)output);
        
        return 0;
    }
}

void n_mergesort(void *base, size_t nel, size_t width, int (^cmp)(const void *, const void *))
{
    
}
