//
//  QWTabBarController.m
//  QW京东Demo
//
//  Created by mac on 16/1/14.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "QWTabBarController.h"
#import "QWBadgeView.h"
#import "MainHeader.h"
#import "QWCartTool.h"

@interface QWTabBarController ()

@property (nonatomic, strong) NSMutableArray *tabBarItems;
@property (nonatomic, weak) QWCartViewController *cartVC;
// cartVC的item(用于添加badgeView)
@property (nonatomic, weak) UITabBarItem *item;

@end

@implementation QWTabBarController

- (NSMutableArray *)tabBarItems {
    
    if (_tabBarItems == nil) {
        _tabBarItems = [NSMutableArray array];
    }
    
    return _tabBarItems;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabBar.backgroundImage = [UIImage imageNamed:@"tabBar_bg"];
    
    // 设置子控制器
    [self addChildViewControllers];
}

// 在viewWillAppear:方法中添加子控件才是显示在最上面的,同时badgeView的值会随时更新
- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    // 添加通知观察者
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(updateBadgeValue)
                                                 name:QWProductBuyCountDidChangeNotification
                                               object:nil];
    // 添加badgeView
    [self addBadgeViewOnTabBarButtons];
}

- (void)updateBadgeValue {
    _cartVC.tabBarItem.badgeValue = [QWCartTool totalCount];
}

#pragma mark - 添加多个子控制器
- (void)addChildViewControllers {
    // 首页
    QWHomeViewController *homeVC = [[QWHomeViewController alloc] init];
    
    [self addOneChildViewController:homeVC
                        normalImage:[UIImage originalImageNamed:@"tabBar_home_normal"]
                       pressedImage:[UIImage originalImageNamed:@"tabBar_home_press"]
                 navigationBarTitle:@""];
    
    // 分类
    QWCategoryViewController *categoryVC = [[QWCategoryViewController alloc] init];
    
    [self addOneChildViewController:categoryVC
                        normalImage:[UIImage originalImageNamed:@"tabBar_category_normal"]
                       pressedImage:[UIImage originalImageNamed:@"tabBar_category_press"]
                 navigationBarTitle:@""];
    
    
    // 发现
    QWDiscoverViewController *discoverVC = [[QWDiscoverViewController alloc] init];
    
    [self addOneChildViewController:discoverVC
                        normalImage:[UIImage originalImageNamed:@"tabBar_find_normal"]
                       pressedImage:[UIImage originalImageNamed:@"tabBar_find_press"]
                 navigationBarTitle:@"发现"];
    
    // 购物车
    QWCartViewController *cartVC = [[QWCartViewController alloc] init];
    
    [self addOneChildViewController:cartVC
                        normalImage:[UIImage originalImageNamed:@"tabBar_cart_normal"]
                       pressedImage:[UIImage originalImageNamed:@"tabBar_cart_press"]
                 navigationBarTitle:@"购物车"];
    _cartVC = cartVC;
    
    // 我的
    QWMyJDViewController *MyVC = [[QWMyJDViewController alloc] init];
    
    [self addOneChildViewController:MyVC
                        normalImage:[UIImage originalImageNamed:@"tabBar_myJD_normal"]
                       pressedImage:[UIImage originalImageNamed:@"tabBar_myJD_press"]
                 navigationBarTitle:@"我的京东"];
    
}

#pragma mark - 添加1个子控制器
- (void)addOneChildViewController:(UIViewController *)viewController
                      normalImage:(UIImage *)normalImage
                     pressedImage:(UIImage *)pressedImage
               navigationBarTitle:(NSString *)title{
    
    // 设置子控制器导航条标题
    viewController.navigationItem.title = title;
    // 设置标签图片
    viewController.tabBarItem.image = normalImage;
    viewController.tabBarItem.selectedImage = pressedImage;
    
    // 添加子控制器至导航控制器
    QWNavigationController *navigationVC
    = [[QWNavigationController alloc] initWithRootViewController:viewController];
    
    // 添加导航控制器
    [self addChildViewController:navigationVC];
    
    // 添加tabBarItem至数组
    [self.tabBarItems addObject:viewController.tabBarItem];
    
}

// 添加所有badgeView
- (void)addBadgeViewOnTabBarButtons {
    // 设置初始的badegValue
    _cartVC.tabBarItem.badgeValue = [QWCartTool totalCount];
    int i = 0;
    for (UITabBarItem *item in self.tabBarItems) {
        
        if (i == 3) {  // 只在第4个按钮上添加
            [self addBadgeViewWithBadgeValue:item.badgeValue atIndex:i];
            // 监听item的变化情况
            [item addObserver:self forKeyPath:@"badgeValue" options:NSKeyValueObservingOptionNew context:nil];
            _item = item;
        }
        i++;
    }
}

// 为某个按钮添加一个自定义badgeView
- (void)addBadgeViewWithBadgeValue:(NSString *)badgeValue atIndex:(NSInteger)index {
    
    QWBadgeView *badgeView = [QWBadgeView buttonWithType:UIButtonTypeCustom];
    
    // 计算badgeView位置
    CGFloat tabBarButtonWidth = self.tabBar.width / self.tabBarItems.count;
    
    badgeView.centerX = index * tabBarButtonWidth + 40;
    
    // tag
    badgeView.tag = index + 1;
    
    // 传入badgeValue
    badgeView.badgeValue = badgeValue;
    
    
    [self.tabBar addSubview:badgeView];
}

#pragma mark - 只要监听的item的属性一有新值，就会调用该方法重新给属性赋值
- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context {
    
    for (UIView *subView in self.tabBar.subviews) {
        if ([subView isKindOfClass:[QWBadgeView class]]) {
            if (subView.tag == 4) {
                QWBadgeView *badgeView = (QWBadgeView *)subView;
                badgeView.badgeValue = _cartVC.tabBarItem.badgeValue;
            }
        }
    }
    
}

#pragma mark - 移除观察者
- (void)dealloc {
    [_item removeObserver:self forKeyPath:@"badgeValue"];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end