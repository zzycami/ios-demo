//
//  Weather.h
//  mood
//
//  Created by damingdan on 13-11-23.
//  Copyright (c) 2013年 damingdan. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString* CITY_URL = @"http://iframe.ip138.com/ic.asp";
static NSString* WEATHER_URL_BASE = @"http://www.weather.com.cn/data/cityinfo/";
static NSString* WEATHER_URL_END = @".html";
static NSString* CITY_FILE = @"city.txt";
// 天气的有效时间长度， 1小时，单位ms
//static NSInteger VALID_TIME = 60*1000;

@interface Weather : NSObject
@property(nonatomic, strong) NSArray *cityList;
//根据当前的IP地址获取省份
- (NSString *) getCurrentCityName;

// 根据城市名称获取城市ID
- (NSString *) getCityIdByName:(NSString *)cityName;

- (NSDictionary *) getWeather:(NSString *)cityCode;

@end
