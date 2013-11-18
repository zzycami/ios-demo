//
//  main.m
//  TestDemo
//
//  Created by damingdan on 13-11-16.
//  Copyright (c) 2013年 damingdan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TimeKit.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        TimeKit *timeKit = [[TimeKit alloc] init];
        NSLog(@"%@", [timeKit getStartDateOfToday]);
        NSLog(@"%@", [timeKit getEndDateOfToday]);
        
        //NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:1363948516];
        //NSLog(@"1363948516  = %@",confromTimesp);
    }
    return 0;
}

