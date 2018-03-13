//
//  RDInternationalControl.m
//  rder
//
//  Created by gonghonglou on 2018/3/13.
//  Copyright © 2018年 gonghonglou. All rights reserved.
//

#import "RDInternationalControl.h"
#import "NSBundle+RDLanguage.h"

@interface RDInternationalControl ()

@end

@implementation RDInternationalControl

static RDInternationalControl *currentLanguage;

+ (void)initLanguage {
    [RDInternationalControl setUserlanguage:[RDInternationalControl userLanguage] init:YES];
}

/**
 Returns whether or not the language is RTL, returns true for HEBREW and ARABIC, false otherwise
 */
+ (BOOL)isRTL {
    NSString *currentCode = [RDInternationalControl userLanguage];
    if ([[RDInternationalControl CHINESE] containsObject:currentCode]) {
        currentCode = [[RDInternationalControl CHINESE] firstObject];
    } else if ([[RDInternationalControl ENGLISH] containsObject:currentCode]) {
        currentCode = [[RDInternationalControl ENGLISH] firstObject];
    } else {
        currentCode = [[RDInternationalControl CHINESE] firstObject];
    }
    return ([NSLocale characterDirectionForLanguage:currentCode] == NSLocaleLanguageDirectionRightToLeft);
}

+ (NSArray *)ENGLISH {
    return @[@"en"];
}

+ (NSArray *)CHINESE{
    return @[@"zh-Hans", @"zh-Hant"];
}

// 设置当前语言
+ (void)setUserlanguage:(NSString *)language {
    [self setUserlanguage:language init:NO];
}

// 设置当前语言
+ (void)setUserlanguage:(NSString *)language init:(BOOL)isInit {
    if ([[RDInternationalControl CHINESE] containsObject:language]) {
        language = [[RDInternationalControl CHINESE] firstObject];
    } else if ([[RDInternationalControl ENGLISH] containsObject:language]) {
        language = [[RDInternationalControl ENGLISH] firstObject];
    } else {
        language = [[RDInternationalControl CHINESE] firstObject];
    }
    if(![[self userLanguage] isEqualToString:language] || isInit){
        [self saveObject:language
                  forKey:RDLanguageKey];
        [NSBundle setLanguage:language];
        [[NSNotificationCenter defaultCenter]postNotificationName:NotificationLanguageChanged object:currentLanguage];
    }
}

+ (NSString *)userLanguage {//获取应用当前语言
    NSString *defaultLanguage;
    NSArray *languages = [[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"];
    if (languages.count > 0) {
        defaultLanguage = languages[0];
    }
    NSString* language = [self getObjectForKey:RDLanguageKey defaultValue:defaultLanguage];
    return language;
}

+ (id)getObjectForKey:(NSString*)aKey defaultValue:(id)value {
    id object = [[NSUserDefaults standardUserDefaults] objectForKey:aKey];
    if (!object) {
        return value;
    }
    return object;
}

+ (void)saveObject:(id)object forKey:(NSString*)aKey {
    if (aKey && object) {
        [[NSUserDefaults standardUserDefaults] setObject:object forKey:aKey];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

@end


