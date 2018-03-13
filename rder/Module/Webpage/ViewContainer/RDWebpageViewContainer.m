//
//  RDWebpageViewContainer.m
//  rder
//
//  Created by gonghonglou on 2018/3/13.
//  Copyright © 2018年 gonghonglou. All rights reserved.
//

#import "RDWebpageViewContainer.h"

@implementation RDWebpageViewContainer

- (instancetype)init {
    self = [super init];
    if (self) {
        self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        self.tableView.backgroundColor = BACKGROUND_COLOR;
        [self addSubview:self.tableView];
        @weakify(self);
        [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            @strongify(self);
            make.edges.equalTo(self).with.insets(UIEdgeInsetsZero);
        }];
        self.tableView.rowHeight = TABLEVIEW_ROW_HEIGHT;
        self.tableView.tableFooterView = [UIView new];
        
        self.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
        self.searchController.searchBar.tintColor = RDER_MAIN_COLOR;
        self.searchController.searchBar.barTintColor = BACKGROUND_COLOR;
        self.searchController.searchBar.placeholder = NSLocalizedString(@"收录", nil);
        self.searchController.dimsBackgroundDuringPresentation = NO;
        UIImageView *barImageView = [[[self.searchController.searchBar.subviews firstObject] subviews] firstObject];
        barImageView.layer.borderColor = BACKGROUND_COLOR.CGColor;
        barImageView.layer.borderWidth = 1;
        UIView *searchView = [UIView new];
        [searchView addSubview:self.searchController.searchBar];
        searchView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 43.5);
        self.tableView.tableHeaderView = searchView;
    }
    return self;
}

@end
