//
//  QWRootVCSelectionTool.m
//  QW京东Demo
//
//  Created by mac on 16/1/21.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "QWRootVCSelectionTool.h"

#import "QWOAuthViewController.h"
#import "QWTabBarController.h"

#import "QWAccountTool.h"


@implementation QWRootVCSelectionTool

#pragma mark - 根据授权与否设置window的根控制器
#warning 此项目有实现京东授权，但是此APPkey在授权的时候经常跳转 404。有兴趣的童鞋可以自行申请 key 进行测试。
#warning 测试key 可以看 SCNote.c 文件
+ (void)setRootViewControllerForWindow:(UIWindow *)window {
    
    
    // 2. 选择根控制器:判断access_Token是否有效
    if ([QWAccountTool account] == nil) { // 1. 如果授权过期或没有授权过
        
        // 设置OAuth授权控制器为根控制器
        QWOAuthViewController *OAuthVC = [[QWOAuthViewController alloc] init];
        window.rootViewController = OAuthVC;
        
    } else {                            // 2. 如果授权过
//
        // 设置TabBarController为根控制器
        QWTabBarController *tabBarVC = [[QWTabBarController alloc] init]; // TabBarController一创建就加载(ViewDidLoad)
        window.rootViewController = tabBarVC;
    }

}

@end