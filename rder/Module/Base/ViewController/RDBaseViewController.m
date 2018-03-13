//
//  RDBaseViewController.m
//  rder
//
//  Created by gonghonglou on 2016/10/19.
//  Copyright © 2016年 gonghonglou. All rights reserved.
//

#import "RDBaseViewController.h"

@interface RDBaseViewController () <UIGestureRecognizerDelegate>

@end

@implementation RDBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self layoutBaseView];
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
}

/**
 *  设置navigationController
 */
-(void)layoutBaseView {
    // 背景色
    self.view.backgroundColor = [UIColor whiteColor];
    //back item
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeSystem];
    backButton.tintColor = RDER_MAIN_COLOR;
    [backButton setFrame:CGRectMake(0, 0, NAVAGATION_ITEM_WIFTH, NAVAGATION_ITEM_HETGHT)];
    [backButton setImage:[UIImage imageNamed:NAVAGATION_BACK] forState:UIControlStateNormal];
    [backButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    [backButton addTarget:self action:@selector(clickBackButton) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    UIBarButtonItem *spacerItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spacerItem.width = -8;
    self.navigationItem.leftBarButtonItems = @[spacerItem, backButtonItem];
}

/**
 *  隐藏回退按钮
 */
- (void)hideBackButtonItem:(BOOL)show {
    if (show) {
        self.navigationItem.leftBarButtonItems = nil;
    }
}

/**
 *  返回上一层界面
 */
- (void)clickBackButton {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
