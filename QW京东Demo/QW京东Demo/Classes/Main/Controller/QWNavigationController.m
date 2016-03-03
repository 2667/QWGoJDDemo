//
//  QWNavigationController.m
//  QW京东Demo
//
//  Created by mac on 16/1/14.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "QWNavigationController.h"


#define QWNavigationBarTitleFont [UIFont systemFontOfSize:18]
#define QWNavigationBarButtonFont [UIFont systemFontOfSize:14]

@interface QWNavigationController ()

@end

@implementation QWNavigationController

//一初始化该类，就会调用该方法 近类第一次实例化时调用
+ (void)initialize
{
    //1.获取当前类下全局的UIBarButtonItem, 这里的self指[SCNavigationController class]
    UIBarButtonItem *allNavigationItem = [UIBarButtonItem appearance];
    //设置按钮标题颜色、字体
    NSMutableDictionary *textAttributeForButton = [NSMutableDictionary dictionary];
    textAttributeForButton[NSForegroundColorAttributeName] = [UIColor grayColor];
    textAttributeForButton[NSFontAttributeName] = QWNavigationBarButtonFont;
    
    [allNavigationItem setTitleTextAttributes:textAttributeForButton forState:UIControlStateNormal];
    
    //2.获取当前类下全局的NavigationBar, 这里的self指[UINavigationController class]
    UINavigationBar *allNavigationBar = [UINavigationBar appearance];
    //设置标题字体
    NSMutableDictionary *textAttributeForTitle = [NSMutableDictionary dictionary];
    textAttributeForTitle[NSFontAttributeName] = QWNavigationBarTitleFont;
    
    [allNavigationBar setTitleTextAttributes:textAttributeForTitle];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置导航条背景图片
    [self.navigationBar setBackgroundImage:[UIImage stretchableImageNamed:@"bg_white_top"] forBarMetrics:UIBarMetricsDefault];
    
    // 设置UINavigationController 代理为self
    self.delegate = self;
    
}
@end
