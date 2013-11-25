//
//  HttpKit.h
//  asynImage
//
//  Created by damingdan on 13-11-13.
//  Copyright (c) 2013年 damingdan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpKit : NSObject <NSURLConnectionDelegate>
+ (NSData *)httpGet:(NSString*)urlString;

+ (NSData *)httpGetWithURL:(NSURL *)url;

+ (NSData *)httpPostWithURL:(NSURL *)url  withParameter:(NSString *)postParameter;

+ (NSData *)httpPost:(NSString *)urlString  withParameter:(NSString *)postParameter;
@end
