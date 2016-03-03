
//
//  QWAppVersiontool.m
//  QW京东Demo
//
//  Created by mac on 16/1/21.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "QWAppVersiontool.h"



@implementation QWAppVersiontool

// 获取保存的上一个版本信息
+ (NSString *)savedAppVersion {
    
    return [[NSUserDefaults standardUserDefaults] stringForKey:QWVersionKey];
}

// 保存新版本信息（偏好设置）
+ (void)saveNewAppVersion:(NSString *)version {
    
    [[NSUserDefaults standardUserDefaults] setObject:version forKey:QWVersionKey];
}

@end