//
//  RDCoordinatingController.m
//  rder
//
//  Created by gonghonglou on 2018/3/12.
//  Copyright © 2018年 gonghonglou. All rights reserved.
//

#import "RDCoordinatingController.h"
#import "RDWebpageViewController.h"
#import "RDSubscribeViewController.h"
#import "RDMineViewController.h"

@interface RDCoordinatingController ()

@property (nonatomic, strong) RDWebpageViewController *webpageVC;

@property (nonatomic, strong) RDSubscribeViewController *subscribeVC;

@property (nonatomic, strong) RDMineViewController *mineVC;

@end


@implementation RDCoordinatingController

/**
 单例
 
 @return RDCoordinatingController
 */
+ (RDCoordinatingController *)sharedInstance {
    static RDCoordinatingController *sharedInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedInstance = [self new];
    });
    return sharedInstance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setRootViewController];
    }
    return self;
}

- (void)setRootViewController {
    self.webpageVC = [RDWebpageViewController new];
    self.webpageVC.tabBarItem.title = NSLocalizedString(@"收录", nil);
    self.webpageVC.tabBarItem.image = [[UIImage imageNamed:TABBAR_WEBPAGE] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.webpageVC.tabBarItem.selectedImage = [[UIImage imageNamed:TABBAR_WEBPAGE_SELECTED] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController *webpageNC = [[UINavigationController alloc] initWithRootViewController:self.webpageVC];
    
    self.subscribeVC = [RDSubscribeViewController new];
    self.subscribeVC.tabBarItem.title = NSLocalizedString(@"订阅", nil);
    self.subscribeVC.tabBarItem.image = [[UIImage imageNamed:TABBAR_SUBSCRIBE] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.subscribeVC.tabBarItem.selectedImage = [[UIImage imageNamed:TABBAR_SUBSCRIBE_SELECTED] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController *subscribeNC = [[UINavigationController alloc] initWithRootViewController:self.subscribeVC];
    
    self.mineVC = [RDMineViewController new];
    self.mineVC.tabBarItem.title = NSLocalizedString(@"我的", nil);
    self.mineVC.tabBarItem.image = [[UIImage imageNamed:TABBAR_MINE] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.mineVC.tabBarItem.selectedImage = [[UIImage imageNamed:TABBAR_MINE_SELECTED] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController *mineNC = [[UINavigationController alloc] initWithRootViewController:self.mineVC];
    
    UITabBarController *tabBC = [UITabBarController new];
    tabBC.tabBar.tintColor = RDER_MAIN_COLOR;
    tabBC.viewControllers = [NSArray arrayWithObjects:webpageNC, subscribeNC, mineNC, nil];
    self.activeViewController = tabBC;
}

@end
