//
//  MainViewController.h
//  SideSlideMenu
//
//  Created by damingdan on 13-11-19.
//  Copyright (c) 2013年 damingdan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SideSlideMenuViewController.h"

@interface MainViewController : UIViewController<SideSlideMenuDelegate>

@property(nonatomic, strong) UIViewController *main;
@property(nonatomic, strong) SideSlideMenuViewController *menu;
@property(nonatomic, strong) UISwipeGestureRecognizer *swipeLeft;
@property(nonatomic, strong) UISwipeGestureRecognizer *swipeRight;
@property(nonatomic, strong) UITapGestureRecognizer *tap;
@property(nonatomic) BOOL isMenuOpen;


- (id) init;

@end
