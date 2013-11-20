//
//  MainViewController.m
//  SideSlideMenu
//
//  Created by damingdan on 13-11-19.
//  Copyright (c) 2013年 damingdan. All rights reserved.
//

#import "MainViewController.h"
#import "BlueViewController.h"
#import "UIView+Origami.h"

@interface MainViewController ()

@end

@implementation MainViewController
@synthesize main = _main;
@synthesize menu = _menu;
@synthesize swipeLeft = _swipeLeft;
@synthesize swipeRight = _swipeRight;
@synthesize tap = _tap;
@synthesize isMenuOpen = _isMenuOpen;


- (UISwipeGestureRecognizer *) swipeLeft {
    if (!_swipeLeft) {
        _swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(closeMenu)];
        [_swipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    }
    return _swipeLeft;
}

- (UISwipeGestureRecognizer *) swipeRight {
    if (!_swipeRight) {
        _swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(openMenu)];
        [_swipeRight setDirection:UISwipeGestureRecognizerDirectionRight];
    }
    return _swipeRight;
}

- (UITapGestureRecognizer *) tap {
    if (!_tap) {
        _tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeMenu)];
    }
    return _tap;
}

- (UIViewController *) main{
    if (!_main) {
        _main = [[UIViewController alloc] init];
    }
    return _main;
}

- (SideSlideMenuViewController *) menu{
    if (!_menu) {
        NSArray *titles = @[@"今日心情",@"我的心事", @"设置", @"关于", @"帮助"];;
        _menu = [[SideSlideMenuViewController alloc] initWithTitles:titles withDelegate:self];
    }
    return _menu;
}

- (id) init{
    self = [super init];
    if (self) {
        // to do init
        self.isMenuOpen = NO;
        [self.view addGestureRecognizer:self.swipeLeft];
        [self.view addGestureRecognizer:self.swipeRight];
    }
    return self;
}

- (void)viewDidLoad
{
    BlueViewController *blue = [[BlueViewController alloc] init];
    [self changeMainView:[[UINavigationController alloc] initWithRootViewController:blue]];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void) changeMainView:(UIViewController *) viewController{
    // change the main view controller
    [self.main.view removeFromSuperview];
    self.main = viewController;
    self.main.view.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleBottomMargin;
    self.main.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    
    
    UINavigationController *navgation = (UINavigationController *)self.main;
    UIViewController *tempVC = [navgation.viewControllers objectAtIndex:0];
    
    UIButton *menuButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 25, 15)];
    [menuButton setImage:[UIImage imageNamed:@"lines"] forState:UIControlStateNormal];
    [menuButton setContentEdgeInsets:UIEdgeInsetsMake(0, 6, 0, 0)];
    [menuButton addTarget:self action:@selector(changeMenu) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barButtomItem = [[UIBarButtonItem alloc] initWithCustomView:menuButton];
    tempVC.navigationItem.leftBarButtonItem = barButtomItem;
    [self.view addSubview:self.main.view];
}


- (void) openMenu{
    if (!self.isMenuOpen) {
        self.menu.view.frame = CGRectMake(0, 0, 161.5, self.menu.view.frame.size.height);
        [self.main.view showOrigamiTransitionWith:self.menu.view NumberOfFolds:3 Duration:.2 Direction:XYOrigamiDirectionFromLeft completion:^(BOOL finished){
            self.isMenuOpen = !self.isMenuOpen;
            [self.main.view addGestureRecognizer:self.tap];
        }];
    }
}

- (void) closeMenu{
    if (self.isMenuOpen) {
        [self.main.view hideOrigamiTransitionWith:self.menu.view NumberOfFolds:3 Duration:.2 Direction:XYOrigamiDirectionFromLeft completion:^(BOOL finished){
            self.isMenuOpen = !self.isMenuOpen;
            [self.main.view removeGestureRecognizer:self.tap];
        }];
    }
}

- (void) changeMenu {
    if (self.isMenuOpen) {
        [self closeMenu];
    }else {
        [self openMenu];
    }
}

#pragma mark - SideSlideMenuDelegate

- (void) didSelectElementAtIndex:(NSInteger)index{
}
@end
