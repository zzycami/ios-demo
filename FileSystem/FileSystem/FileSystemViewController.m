//
//  FileSystemViewController.m
//  FileSystem
//
//  Created by damingdan on 13-11-12.
//  Copyright (c) 2013年 damingdan. All rights reserved.
//

#import "FileSystemViewController.h"

@interface FileSystemViewController ()

@end

@implementation FileSystemViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //对于错误信息
    NSError *error;
    
    // 创建文件管理器
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    // 指向文件目录
    NSString *documentsDirectiry = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    
    // 创建一个文件
    NSString *filePath = [documentsDirectiry stringByAppendingPathComponent:@"file.txt"];
    
    //需要写入的字符串
    NSString *str= @"iPhoneDeveloper Tips\nhttp://iPhoneDevelopTips,com";
    
    //写入文件
    [str writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:&error];
    
    //显示文件目录的内容
    NSLog(@"Documentsdirectory: %@",[fileManager contentsOfDirectoryAtPath:documentsDirectiry error:&error]);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
