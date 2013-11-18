//
//  TimeKit.h
//  TestDemo
//
//  Created by damingdan on 13-11-16.
//  Copyright (c) 2013年 damingdan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimeKit : NSObject
// 获取当前时区的当前时间的时间戳
- (long) getCurrentTimestamp;

// 获取当前时区的当前时间
- (NSDate *) getCurrentDate;

// 获取当前时区的今天开始时间的时间戳
- (long) getStartStampOfToday;

// 获取当前时区的今天开始时间的日期
- (NSDate *) getStartDateOfToday;

// 获取当前时区的今天的结束时间的时间戳
- (long) getEndStampOfToday;

// 获取当前时区的今天结束时间的日期
- (NSDate *) getEndDateOfToday;

// 将时间转化为本地的时区
- (NSDate *) changeToLocalDate:(NSDate *)date;

// 将时间戳转化为Date类型的时间
- (NSDate *) chageTimestampToDate:(long)timestamp;

- (long) getStartStampOfYesterday;

- (NSDate *) getStartDateOfYesterday;

- (long) getEndStampOfYesterday;

- (NSDate *) getEndDateOfYesterday;

@end
