//
//  FileHelpers.h
//  AAPinChe
//
//  Created by Reese on 13-1-17.
//  Copyright (c) 2013年 damingdan. All rights reserved.
//

#import <Foundation/Foundation.h>

// 获取沙盒中的文档路径中的文件路径, ext./Users/xdyou/Library/Application Support/iPhone Simulator/6.1/Applications/D0DB32B1-5AE4-4978-A94F-23BC7707A2F9/Documents/test.txt
NSString *pathInDocumentDirectory(NSString *fileName);

// 获取沙盒中缓存文件
NSString *pathInCacheDirectory(NSString *fileName);

// 根据URL的hash码为图片文件命名
NSString *pathForURL(NSURL *aURL);

// 根据URL的hash码为图片文件命名
BOOL hasCachedImage(NSURL *aURL);

// 判断是否已经缓存过这个URL
NSString *hashCodeForURL(NSURL *aURL);