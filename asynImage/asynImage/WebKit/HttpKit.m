//
//  HttpKit.m
//  asynImage
//
//  Created by damingdan on 13-11-13.
//  Copyright (c) 2013年 damingdan. All rights reserved.
//

#import "HttpKit.h"

@implementation HttpKit

+ (NSData *)httpGet:(NSString*)urlString{
    NSURL *url = [NSURL URLWithString:urlString];
    return [self httpGetWithURL:url];
}

+ (NSData *)httpGetWithURL:(NSURL *)url{
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    if (!data) {
        NSLog(@"http get 请求:%@,数据下载失败", url);
        return nil;
    }else {
        return data;
    }
}

@end
