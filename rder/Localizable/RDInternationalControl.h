//
//  RDInternationalControl.h
//  rder
//
//  Created by gonghonglou on 2018/3/13.
//  Copyright © 2018年 gonghonglou. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 系统语言
 */
typedef NS_ENUM(NSInteger, LANGUAGE_TYPE) {
    LANGUAGE_TYPE_FOLLOWING = 0,    // 跟随系统
    LANGUAGE_TYPE_ZH = 1,           // 中文
    LANGUAGE_TYPE_EN = 2            // 英语
};


#define TextAlignment [[Language currentLanguage]textAlignment]

#define NotificationLanguageChanged @"languageChanged"

#define RDLanguageKey @"language"

#define CurrentLanguageIsChinese ([[RDInternationalControl CHINESE] containsObject:[RDInternationalControl userLanguage]])

#import <Foundation/Foundation.h>

@interface RDInternationalControl : NSObject

+ (void)initLanguage;

/**
 Returns whether or not the language is RTL, returns true for HEBREW and ARABIC, false otherwise
 */
+ (BOOL)isRTL;

+ (NSArray *)ENGLISH;

+ (NSArray *)CHINESE;

+ (void)setUserlanguage:(NSString *)language;//设置当前语言

+ (NSString *)userLanguage;//获取应用当前语言

@end

