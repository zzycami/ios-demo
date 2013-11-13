//
//  AsynImageViewController.m
//  asynImage
//
//  Created by damingdan on 13-11-12.
//  Copyright (c) 2013年 damingdan. All rights reserved.
//

#import "AsynImageViewController.h"
#import "FileHelpers.h"
#import "ImageCacher.h"
#import "HttpKit.h"

@interface AsynImageViewController ()
@property (weak, nonatomic) IBOutlet UITextField *imageURLTextView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation AsynImageViewController
@synthesize imageView = _imageView;

- (IBAction)startDownload:(id)sender {
    
    //NSString* urlString = self.imageURLTextView.text;
    
    NSString* urlString = @"http://fmn.rrimg.com/fmn065/xiaozhan/20131113/1620/original_8LPs_293b000026b1118e.jpg";
    dispatch_queue_t downloadQueue = dispatch_queue_create("image downloader", NULL);
    dispatch_async(downloadQueue, ^{
        NSLog(@"start load image %@", urlString);
        NSData *imageData = [HttpKit httpGet:urlString];
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"start update the image");
            CATransition *transtion = [CATransition animation];
            transtion.duration = 0.5;
            [transtion setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
            [transtion setType:@"cube"];
            [transtion setSubtype:kCATransitionFromRight];
            
            [self.imageView.layer addAnimation:transtion forKey:@"transtionKey"];
            UIImage *image = [UIImage imageWithData:imageData];
            self.imageView.image = image;
        });
    });
}

- (IBAction)NSThreadDownload:(id)sender {
    NSString* urlString = @"http://fmn.rrimg.com/fmn065/xiaozhan/20131113/1620/original_8LPs_293b000026b1118e.jpg";
    //NSString* urlString = self.imageURLTextView.text;
    NSURL *networkURL = [NSURL URLWithString:urlString];
    if (hasCachedImage(networkURL)) {
        UIImage* image = [UIImage imageWithContentsOfFile:pathForURL(networkURL)];
        self.imageView.image = image;
    }else {
        NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:networkURL,@"url",self.imageView ,@"imageView",nil];
        [NSThread detachNewThreadSelector:@selector(cacheImage:) toTarget:[ImageCacher defaultCacher] withObject:dic];
    }
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
