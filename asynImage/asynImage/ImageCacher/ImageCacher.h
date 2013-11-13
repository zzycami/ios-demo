//
//  ImageCacher.h
//  AAPinChe
//
//  Created by Reese on 13-4-3.
//  Copyright (c) 2013年 damingdan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface ImageCacher : NSObject
// 设定图片的动画方式
@property (retain,nonatomic) NSString *type;

// 默认的缓存器
+(ImageCacher*)defaultCacher;

// 缓存图片
-(void)cacheImage:(NSDictionary*)aDic;

// 设定动画方式的具体接口
-(void) setFlip;
-(void) setCube;
-(void) setFade;
@end
