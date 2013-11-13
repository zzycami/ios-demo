//
//  HttpKit.h
//  asynImage
//
//  Created by damingdan on 13-11-13.
//  Copyright (c) 2013年 damingdan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpKit : NSObject
+ (NSData *)httpGet:(NSString*)urlString;
+ (NSData *)httpGetWithURL:(NSURL *)url;
@end
