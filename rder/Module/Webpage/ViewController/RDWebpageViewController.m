//
//  RDWebpageViewController.m
//  rder
//
//  Created by gonghonglou on 2018/3/12.
//  Copyright © 2018年 gonghonglou. All rights reserved.
//

#import "RDWebpageViewController.h"
#import "RDWebpageViewContainer.h"

@interface RDWebpageViewController () <UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating>

@property (nonatomic, strong) RDWebpageViewContainer *viewContainer;

@end

@implementation RDWebpageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self layoutUI];
}

#pragma mark - 界面布局
- (void)layoutUI {
    [self layoutNavagationItem];
    
    self.viewContainer = [RDWebpageViewContainer new];
    self.view = self.viewContainer;
    
    self.viewContainer.tableView.dataSource = self;
    self.viewContainer.tableView.delegate = self;
    self.viewContainer.searchController.searchResultsUpdater = self;
}

#pragma mark 添加NavagationItem
-(void)layoutNavagationItem {
    [self hideBackButtonItem:YES];
    //title viwe
    UIImageView *titleImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:RDER_TITLE_VIEW]];
    titleImage.frame = CGRectMake(0, 0, NAVAGATION_TITLEVIEW_WIDTH, NAVAGATION_TITLEVIEW_HEIGHT);
    self.navigationItem.titleView = titleImage;
    // 输入按钮
    UIButton *writhButton = [UIButton buttonWithType:UIButtonTypeSystem];
    writhButton.tintColor = RDER_MAIN_COLOR;
    [writhButton setFrame:CGRectMake(0, 0, NAVAGATION_ITEM_WIFTH, NAVAGATION_ITEM_HETGHT)];
    [writhButton setImage:[UIImage imageNamed:NAVAGATION_WRITE] forState:UIControlStateNormal];
    [writhButton addTarget:self action:@selector(clickWriteButton) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *writhButtonItem = [[UIBarButtonItem alloc] initWithCustomView:writhButton];
    self.navigationItem.rightBarButtonItem = writhButtonItem;
}

- (void)clickWriteButton {
    
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@""];
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - UISearchResultsUpdating
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    
}

@end

