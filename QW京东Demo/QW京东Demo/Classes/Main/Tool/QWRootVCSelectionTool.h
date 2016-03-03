//
//  QWRootVCSelectionTool.h
//  QW京东Demo
//
//  Created by mac on 16/1/21.
//  Copyright © 2016年 mac. All rights reserved.
//  选择根控制器

#import <Foundation/Foundation.h>

@interface QWRootVCSelectionTool : NSObject

/**
 *   根据是否授权设置根控制器
 */
+ (void)setRootViewControllerForWindow:(UIWindow *)window;

@end