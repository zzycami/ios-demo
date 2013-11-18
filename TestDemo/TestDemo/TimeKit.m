//
//  TimeKit.m
//  TestDemo
//
//  Created by damingdan on 13-11-16.
//  Copyright (c) 2013年 damingdan. All rights reserved.
//

#import "TimeKit.h"

@implementation TimeKit

- (long) getCurrentTimestamp{
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[[self getCurrentDate] timeIntervalSince1970]];
    return (long)[timeSp longLongValue];
}

- (long) dateToTimestamp:(NSDate *) date{
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[date timeIntervalSince1970]];
    return (long)[timeSp longLongValue];
}

- (NSDate *) getCurrentDate{
    NSDate *date = [NSDate date];
    return [self changeToLocalDate:date];
}

- (NSDate *) changeToLocalDate:(NSDate *)date{
    NSTimeZone *timeZone = [NSTimeZone systemTimeZone];
    NSInteger interval = [timeZone secondsFromGMTForDate:date];
    return [date dateByAddingTimeInterval:interval];
}

/*
 FOUNDATION_EXPORT NSString * const NSGregorianCalendar;        //公历（常用）
 FOUNDATION_EXPORT NSString * const NSBuddhistCalendar;         //佛教日历
 FOUNDATION_EXPORT NSString * const NSChineseCalendar;          //中国农历（常用）
 FOUNDATION_EXPORT NSString * const NSHebrewCalendar;           //希伯来日历
 FOUNDATION_EXPORT NSString * const NSIslamicCalendar;          //伊斯兰历
 FOUNDATION_EXPORT NSString * const NSIslamicCivilCalendar;     //伊斯兰教日历
 FOUNDATION_EXPORT NSString * const NSJapaneseCalendar;         //日本日历(和历，常用)
 FOUNDATION_EXPORT NSString * const NSRepublicOfChinaCalendar;  //中华民国日历（台湾）
 FOUNDATION_EXPORT NSString * const NSPersianCalendar;          //波斯历
 FOUNDATION_EXPORT NSString * const NSIndianCalendar;           //印度日历
 FOUNDATION_EXPORT NSString * const NSISO8601Calendar;          //ISO8601（但是现在还不可用）
 */
- (long) getStartStampOfToday{
        return [self dateToTimestamp:[self getStartDateOfToday]];
}

- (NSDate *) getStartDateOfToday{
    NSDate *currentDate = [NSDate date];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    unsigned units  = NSMonthCalendarUnit|NSDayCalendarUnit|NSYearCalendarUnit;
    NSDateComponents *comp = [calendar components:units fromDate:currentDate];
    NSDateComponents *compOfToday = [[NSDateComponents alloc] init];
    [compOfToday setYear:[comp year]];
    [compOfToday setMonth:[comp month]];
    [compOfToday setDay:[comp day]];
    [compOfToday setHour:0];
    [compOfToday setMinute:0];
    [compOfToday setSecond:0];
    return [self changeToLocalDate:[calendar dateFromComponents:compOfToday]];
}

- (long) getStartStampOfYesterday{
    return [self dateToTimestamp:[self getStartDateOfYesterday]];
}

- (NSDate *) getStartDateOfYesterday {
    NSDate *currentDate = [NSDate date];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    unsigned units  = NSMonthCalendarUnit|NSDayCalendarUnit|NSYearCalendarUnit;
    NSDateComponents *comp = [calendar components:units fromDate:currentDate];
    NSDateComponents *compOfToday = [[NSDateComponents alloc] init];
    [compOfToday setYear:[comp year]];
    [compOfToday setMonth:[comp month]];
    [compOfToday setDay:[comp day] - 1];
    [compOfToday setHour:0];
    [compOfToday setMinute:0];
    [compOfToday setSecond:0];
    return [self changeToLocalDate:[calendar dateFromComponents:compOfToday]];
}

- (long) getEndStampOfToday{
    return [self dateToTimestamp:[self getEndDateOfToday]];
}

- (NSDate *) getEndDateOfToday{
    NSDate *currentDate = [NSDate date];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    unsigned units  = NSMonthCalendarUnit|NSDayCalendarUnit|NSYearCalendarUnit;
    NSDateComponents *comp = [calendar components:units fromDate:currentDate];
    NSDateComponents *compOfToday = [[NSDateComponents alloc] init];
    [compOfToday setYear:[comp year]];
    [compOfToday setMonth:[comp month]];
    [compOfToday setDay:[comp day] + 1];
    [compOfToday setHour:0];
    [compOfToday setMinute:0];
    [compOfToday setSecond:0];
    return [self changeToLocalDate:[calendar dateFromComponents:compOfToday]];
}

- (long) getEndStampOfYesterday{
    return [self dateToTimestamp:[self getEndDateOfYesterday]];
}

- (NSDate *) getEndDateOfYesterday {
    NSDate *currentDate = [NSDate date];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    unsigned units  = NSMonthCalendarUnit|NSDayCalendarUnit|NSYearCalendarUnit;
    NSDateComponents *comp = [calendar components:units fromDate:currentDate];
    NSDateComponents *compOfToday = [[NSDateComponents alloc] init];
    [compOfToday setYear:[comp year]];
    [compOfToday setMonth:[comp month]];
    [compOfToday setDay:[comp day]];
    [compOfToday setHour:0];
    [compOfToday setMinute:0];
    [compOfToday setSecond:0];
    return [self changeToLocalDate:[calendar dateFromComponents:compOfToday]];
}


- (NSDate *) chageTimestampToDate:(long)timestamp{
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:timestamp];
    NSLog(@"%ld  = %@",timestamp, confromTimesp);
    return confromTimesp;
}

@end
