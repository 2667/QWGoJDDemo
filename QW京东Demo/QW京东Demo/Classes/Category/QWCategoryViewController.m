//
//  QWCategoryViewController.m
//  QW京东Demo
//
//  Created by mac on 16/1/14.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "QWCategoryViewController.h"
#import "QWCategoryCommon.h"
#import "QWSearchBar.h"

#import "QWCategoryMenuController.h"
#import "QWCategoryDetailController.h"

@interface QWCategoryViewController ()

// 分类主菜单（必须设为全局的）
@property (nonatomic, strong) QWCategoryMenuController *categoryMenuVC;
// 详细分类列表
@property (nonatomic, strong) QWCategoryDetailController *categoryDetailVC;

@end

@implementation QWCategoryViewController

#pragma mark - 懒加载
- (QWCategoryMenuController *)categoryMenuVC {
    
    if (_categoryMenuVC == nil) {
        _categoryMenuVC = [[QWCategoryMenuController alloc] init];
    }
    
    return _categoryMenuVC;
}

- (QWCategoryDetailController *)categoryDetailVC {
    
    if (_categoryDetailVC == nil) {
        _categoryDetailVC = [[QWCategoryDetailController alloc] init];
    }
    
    return _categoryDetailVC;
}

#pragma mark - viewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    // 1. 设置导航条
    [self setNavigationBar];
    
    // 2. 添加分类主菜单
    [self addCategoryMenuView];
    
    // 3. 添加详细分类列表
    [self addCategoryDetailCollectionView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    // 恢复tabBar
    self.hidesBottomBarWhenPushed = NO;
}

#pragma mark - 设置导航条
- (void)setNavigationBar {
    
    // 1. 创建searchBar
    QWSearchBar *searchBar
    = [[QWSearchBar alloc] initWithFrame:CGRectMake(15,
                                                    7,
                                                    QWMainScreenBounds.size.width - 75,
                                                    30)];
    searchBar.placeholder = @"iPhone6s震撼来袭";
    // 2. 中间添加searchBar
    [self.navigationController.navigationBar addSubview:searchBar];
    //    self.navigationItem.titleView = searchBar;
    // 3. 右侧二维码
    self.navigationItem.rightBarButtonItem
    = [UIBarButtonItem barButtonItemWithBackgroundImage:[UIImage originalImageNamed:@"find_icon_sao"]
                                       highlightedImage:nil
                                                 target:self
                                                 action:@selector(scanQRCode:)
                                       forControlEvents:UIControlEventTouchUpInside];
    
}

#pragma mark - 扫一扫
- (void)scanQRCode:(UIButton *)button {
    
    
}

#pragma mark - 添加一级分类菜单
- (void)addCategoryMenuView {
    
    
    // 计算分类主菜单视图尺寸
    CGFloat x = 0;
    CGFloat y = 0;//self.navigationController.navigationBar.frameHeight + SCStatusBarHeight;
    CGFloat width = QWCategoryMenuWidth;
    CGFloat height = self.view.height - y;
    
    self.categoryMenuVC.tableView.frame = CGRectMake(x, y, width, height);
    [self.view addSubview:_categoryMenuVC.tableView];
}

#pragma mark - 添加详细分类列表
- (void)addCategoryDetailCollectionView {
    
    // 计算详细分类列表视图尺寸
    CGFloat x = CGRectGetMaxX(self.categoryMenuVC.tableView.frame);
    CGFloat y = self.categoryMenuVC.tableView.y;
    CGFloat width = self.view.width - QWCategoryMenuWidth;
    CGFloat height = self.view.height - y;
    
    self.categoryDetailVC.view.frame = CGRectMake(x, y, width, height);
    
    [self.view addSubview:_categoryDetailVC.view];
    
}


@end