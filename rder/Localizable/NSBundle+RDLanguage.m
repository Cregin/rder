//
//  NSBundle+RDLanguage.m
//  rder
//
//  Created by gonghonglou on 2018/3/13.
//  Copyright © 2018年 gonghonglou. All rights reserved.
//

#import "NSBundle+RDLanguage.h"
#import "RDInternationalControl.h"
#import <UIKit/UIKit.h>
#import <objc/runtime.h>


static const NSString *RDBundleKey = @"RDLanguageKey";

@interface BundleEx : NSBundle

@end

@implementation BundleEx

- (NSString *)localizedStringForKey:(NSString *)key value:(NSString *)value table:(NSString *)tableName {
    
    NSBundle *bundle = objc_getAssociatedObject(self, &RDBundleKey);
    if (bundle) {
        return [bundle localizedStringForKey:key value:value table:tableName];
    } else {
        return [super localizedStringForKey:key value:value table:tableName];
    }
}

@end

@implementation NSBundle (RDLanguage)

+ (void)setLanguage:(NSString *)language {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        object_setClass([NSBundle mainBundle], [BundleEx class]);
    });
    if ([RDInternationalControl isRTL]) {
        if ([[[UIView alloc] init] respondsToSelector:@selector(setSemanticContentAttribute:)]) {
            [[UIView appearance] setSemanticContentAttribute:
             UISemanticContentAttributeForceRightToLeft];
        }
    } else {
        if ([[[UIView alloc] init] respondsToSelector:@selector(setSemanticContentAttribute:)]) {
            [[UIView appearance] setSemanticContentAttribute:UISemanticContentAttributeForceLeftToRight];
        }
    }
    [[NSUserDefaults standardUserDefaults] setBool:[RDInternationalControl isRTL] forKey:@"AppleTextDirection"];
    [[NSUserDefaults standardUserDefaults] setBool:[RDInternationalControl isRTL] forKey:@"NSForceRightToLeftWritingDirection"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    id value = language ? [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:language ofType:@"lproj"]] : nil;
    objc_setAssociatedObject([NSBundle mainBundle], &RDBundleKey, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


@end


