//
//  SideSlideMenuViewController.m
//  SideSlideMenu
//
//  Created by damingdan on 13-11-19.
//  Copyright (c) 2013年 damingdan. All rights reserved.
//

#import "SideSlideMenuViewController.h"

static NSString *CellIdentifier = @"Cell";

@interface SideSlideMenuViewController ()

@end

@implementation SideSlideMenuViewController
@synthesize delegate = _delegate;
@synthesize tableView = _tableView;
@synthesize titleList = _titleList;

- (id) initWithTitles:(NSArray *)titles withDelegate:(id<SideSlideMenuDelegate>) del {
    self = [super init];
    if(self) {
        self.titleList = titles;
        self.delegate = del;
    }
    return self;
}

- (void)viewDidLoad
{
    // add the table view
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 162, self.view.frame.size.height) style:UITableViewStylePlain];
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    // add the shadow
    UIImageView *shadow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sidebarshadow"]];
    shadow.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    [shadow setFrame:CGRectMake(118, 0, 43.5, self.view.frame.size.height)];
    [self.view addSubview:shadow];
    
    // add sidebar background
    UIImageView *sidebarBg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sidebarbg"]];
    sidebarBg.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    [sidebarBg setFrame:CGRectMake(0, 0, 161.5, self.view.frame.size.height)];
    [self.tableView setBackgroundView:sidebarBg];
    self.tableView.backgroundColor = [UIColor clearColor];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark - Table View data source
- (NSInteger ) numberOfSectionsInTableView:(UITableView *)tableView{
    // Return the number of sections.
    return 1;
}
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.titleList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = [self.titleList objectAtIndex:indexPath.row];
    cell.textLabel.textColor = [UIColor blackColor];
    UIImageView *bg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sidebarcell.png"]];
    [bg setFrame:CGRectMake(0, 0, 161.5, 42.5)];
    
    cell.backgroundView = bg;
    return cell;
}

# pragma mark - Table View delegate
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.delegate respondsToSelector:@selector(didSelectElementAtIndex:)]) {
        [self.delegate didSelectElementAtIndex:indexPath.row];
        [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
}

@end
