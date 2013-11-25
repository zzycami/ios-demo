//
//  main.m
//  TestDemo
//
//  Created by damingdan on 13-11-16.
//  Copyright (c) 2013年 damingdan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TimeKit.h"
#import "Weather.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        Weather *weather = [[Weather alloc] init];
        NSString *cityName = [weather getCurrentCityName];
        NSLog(@"%@", cityName);
        NSString *cityCode = [weather getCityIdByName:cityName];
        NSLog(@"%@", cityCode);
        NSDictionary *dic = [weather getWeather:cityCode];
        NSLog(@"%@", dic);
    }
    return 0;
}

