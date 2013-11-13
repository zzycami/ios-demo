//
//  ImageCacher.m
//  AAPinChe
//
//  Created by Reese on 13-4-3.
//  Copyright (c) 2013年 damingdan. All rights reserved.
//  单例类

#import "ImageCacher.h"
#import "FileHelpers.h"
#import "HttpKit.h"

@implementation ImageCacher

static ImageCacher *defaultCacher=nil;

-(id)init{
    if (defaultCacher) {
        return defaultCacher;
    }else
    {
        self =[super init];
        [self setFlip];
        return self;
    }
}

+ (ImageCacher*)defaultCacher{
    if (!defaultCacher) {
        defaultCacher=[[super allocWithZone:nil]init];
    }
    return defaultCacher;
}

+ (id)allocWithZone:(NSZone *)zone{
    return [self defaultCacher];
}


-(void) setFade{
    _type=kCATransitionFade;
}

-(void) setCube{
   _type=@"cube";
}

-(void) setFlip{
   _type= @"oglFlip";
}

-(void)cacheImage:(NSDictionary*)aDic
{
    // 下载图片
    NSURL *aURL=[aDic objectForKey:@"url"];
    NSLog(@"%@", [aURL description]);
    NSFileManager *fileManager=[NSFileManager defaultManager];
    NSData *data=[HttpKit httpGetWithURL:aURL];
    UIImage *image=[UIImage imageWithData:data];
    if (image==nil) {
        return;
    }
    
    // 设定原图的拉伸和缩放数据
    CGSize origImageSize= [image size];
    CGRect newRect;
    newRect.origin= CGPointZero;
    //拉伸到多大
    newRect.size.width=320;
    newRect.size.height=400;
    //缩放倍数
    float ratio = MIN(newRect.size.width/origImageSize.width, newRect.size.height/origImageSize.height);
    
    // 开始处理图片
    UIGraphicsBeginImageContext(newRect.size);
    CGRect projectRect;
    projectRect.size.width =ratio * origImageSize.width;
    projectRect.size.height=ratio * origImageSize.height;
    projectRect.origin.x= (newRect.size.width -projectRect.size.width)/2.0;
    projectRect.origin.y= (newRect.size.height-projectRect.size.height)/2.0;
    [image drawInRect:projectRect];

    UIImage *small = UIGraphicsGetImageFromCurrentImageContext();
    //压缩比例
    NSData *smallData=UIImageJPEGRepresentation(small, 0.02);
    if (smallData) {
        // 将图片文件写入到沙盒中
        [fileManager createFileAtPath:pathForURL(aURL) contents:smallData attributes:nil];
    }
    
    UIView *view=[aDic objectForKey:@"imageView"];
    //判断view是否还存在 如果tablecell已经移出屏幕会被回收 那么什么都不用做，下次滚到该cell 缓存已存在 不需要执行此方法
    if (view!=nil) {
        // 添加显示时候的动画效果
        CATransition *transtion = [CATransition animation];
        transtion.duration = 0.5;
        [transtion setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
        [transtion setType:_type];
        [transtion setSubtype:kCATransitionFromRight];
        
        [view.layer addAnimation:transtion forKey:@"transtionKey"];
        //[(UIImageView*)view setImage:small];
        ((UIImageView*)view).image = small;
    }
    UIGraphicsEndImageContext();
}
@end
