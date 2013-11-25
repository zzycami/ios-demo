//
//  HttpKit.m
//  asynImage
//
//  Created by damingdan on 13-11-13.
//  Copyright (c) 2013年 damingdan. All rights reserved.
//

#import "HttpKit.h"

@implementation HttpKit

/*!
 功能和httpGetWithURL一样，只不过参数不同
 */
+ (NSData *)httpGet:(NSString*)urlString{
    NSURL *url = [NSURL URLWithString:urlString];
    return [self httpGetWithURL:url];
}

/*!
 发起一次http的get请求，获取网络数据
 */
+ (NSData *)httpGetWithURL:(NSURL *)url{
    return [self httpRequest:url withData:@"" inMethod:@"GET"];
}

/*!
 功能和httpPostWithURL一样，只不过url的参数换成了网址的字符串。
 */
+ (NSData *)httpPost:(NSString *)urlString  withParameter:(NSString *)postParameter{
    NSURL *url = [NSURL URLWithString:urlString];
    return [self httpPostWithURL:url withParameter:postParameter];
}

/*!
 发起一次 http的 post请求，获取从网络中获取数据
 @param url NSURL类型的参数，指向请求的网址
 @param postParameter 需要post的参数，比如说：
 NSString *post = [NSString stringWithFormat:@"email=%@&type=%@", @"zzycami@foxmail.com", @"name"];
 */
+ (NSData *)httpPostWithURL:(NSURL *)url  withParameter:(NSString *)postParameter{
    return [self httpRequest:url withData:postParameter inMethod:@"POST"];
}

+ (NSData *) httpRequest:(NSURL *)url  withData:(NSString *)data  inMethod:(NSString*) method{
    NSData* postData = [data dataUsingEncoding:NSUTF8StringEncoding];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setHTTPMethod:method];
    [request setHTTPBody:postData];
    
    NSURLResponse *response;
    NSError *error = nil;
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    if (error) {
        NSLog(@"Some web error :%@", error.description);
        return nil;
    }else {
        return responseData;
    }
}
@end
