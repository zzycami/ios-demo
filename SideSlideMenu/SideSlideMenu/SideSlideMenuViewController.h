//
//  SideSlideMenuViewController.h
//  SideSlideMenu
//
//  Created by damingdan on 13-11-19.
//  Copyright (c) 2013年 damingdan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SideSlideMenuDelegate;

@interface SideSlideMenuViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
@property(nonatomic, strong) id<SideSlideMenuDelegate> delegate;
@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) NSArray *titleList;

- (id) initWithTitles:(NSArray *)titles withDelegate:(id<SideSlideMenuDelegate>) del;
@end


@protocol SideSlideMenuDelegate <NSObject>
@optional
- (void) didSelectElementAtIndex:(NSInteger)index;
@end