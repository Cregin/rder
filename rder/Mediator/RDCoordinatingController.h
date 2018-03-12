//
//  RDCoordinatingController.h
//  rder
//
//  Created by gonghonglou on 2018/3/12.
//  Copyright © 2018年 gonghonglou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RDCoordinatingController : NSObject

// 记录当前viewController
@property (nonatomic, strong) UIViewController *activeViewController;

/**
 单例
 
 @return RDCoordinatingController
 */
+ (RDCoordinatingController *)sharedInstance;

@end
