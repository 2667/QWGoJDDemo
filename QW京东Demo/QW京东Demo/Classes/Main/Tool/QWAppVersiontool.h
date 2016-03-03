//
//  QWAppVersiontool.h
//  QW京东Demo
//
//  Created by mac on 16/1/21.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QWAppVersiontool : NSObject
/**
 *  之前保存的版本
 *
 *  @return NSString类型的AppVersion
 */
+ (NSString *)savedAppVersion;
/**
 *  保存新版本
 */
+ (void)saveNewAppVersion:(NSString *)version;

@end