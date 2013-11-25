//
//  Weather.m
//  mood
//
//  Created by damingdan on 13-11-23.
//  Copyright (c) 2013年 damingdan. All rights reserved.
//

#import "Weather.h"
#import "HttpKit.h"
#import "Cities.h"

@implementation Weather
@synthesize cityList = _cityList;

- (NSArray *) cityList {
    if (!_cityList) {
        NSArray *cityListString = [cities componentsSeparatedByString:@","];
        NSMutableArray *cityMulList = [[NSMutableArray alloc] init];
        for (NSString *city in cityListString) {
            NSArray *tmp = [city componentsSeparatedByString:@"="];
            [cityMulList addObject:tmp];
        }
        _cityList = cityMulList;
    }
    return _cityList;
}

- (NSString *) getCurrentCityName {
    NSString *cityName = @"";
    
    NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    NSString *ret = [[NSString alloc] initWithData:[HttpKit httpGet:CITY_URL] encoding:enc];
    NSRange range1 = [ret rangeOfString:@"省"];
    if (range1.length > 0) {
        NSRange range2 = [ret rangeOfString:@"市"];
        NSRange cityRange = NSMakeRange(range1.location + 1, range2.location - range1.location -1);
        cityName = [ret substringWithRange:cityRange];
    }else {
        NSArray *cities = @[@"北京", @"上海", @"天津", @"重庆", @"香港", @"澳门"];
        for (NSString *city in cities) {
            NSRange range = [ret rangeOfString:city];
            if (range.length > 0) {
                cityName = city;
            }
        }
    }
    return cityName;
}

- (NSString *) getCityIdByName:(NSString *)cityName{
    if (cityName == nil || [cityName isEqualToString:@""]) {
        return nil;
    }

    for (NSArray *city in self.cityList) {
        if ([city[1] isEqualToString:cityName]) {
            return city[0];
        }
    }
    return nil;
}

//{"city":"杭州","cityid":"101210101","temp1":"15℃","temp2":"4℃","weather":"多云转晴","img1":"d1.gif","img2":"n0.gif","ptime":"08:00"}
- (NSDictionary *) getWeather:(NSString *)cityCode{
    NSString *weatherStr = [NSString stringWithFormat:@"%@%@%@", WEATHER_URL_BASE, cityCode, WEATHER_URL_END];
    NSError *error;
    NSDictionary *content = [NSJSONSerialization JSONObjectWithData:[HttpKit httpGet:weatherStr] options:NSJSONReadingMutableLeaves error:&error];
    return [content objectForKey:@"weatherinfo"];
}


@end
