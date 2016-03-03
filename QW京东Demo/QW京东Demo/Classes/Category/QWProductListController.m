//
//  QWProductListController.m
//  QW京东Demo
//
//  Created by mac on 16/1/21.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "QWProductListController.h"
#import "QWCategoryCommon.h"
#import "QWSearchBar.h"
#import "QWCategoryListToolBar.h"
#import "QWProductCell.h"

#import "QWProduct.h"
#import "QWProductListTool.h"

#import "QWProductMainController.h"
#import "QWNavigationController.h"

@interface QWProductListController ()

// 商品编号
@property (nonatomic, copy) NSString *catelogyId;
// 商品列表(SCProduct)
@property (nonatomic, strong) NSMutableArray *productList;
// 工具条
@property (nonatomic, weak) QWCategoryListToolBar *toolBar;

@end

@implementation QWProductListController

#pragma mark - 懒加载
- (NSMutableArray *)productList {
    if (_productList == nil) {
        _productList = [NSMutableArray array];
    }
    return _productList;
}

#pragma mark - 初始化
- (instancetype)initWithCatelogyId:(NSString *)catelogyId {
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        _catelogyId = catelogyId;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 一开始不显示分割线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    // 请求数据
    [self loadProductListData];
    
    // 1. 设置导航条
    [self setNavigationBar];
    
    // 2. 添加工具条
    [self addToolBar];
}

#pragma mark - 只有在viewDidAppear:方法中修改self.tableView.frame才有效
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    // 3. 下移tableView
    CGFloat X = 0;
    CGFloat Y = CGRectGetMaxY(_toolBar.frame);
    CGFloat width = QWMainScreenBounds.size.width;
    CGFloat height = self.tableView.height - _toolBar.height;
    self.tableView.frame = CGRectMake(X, Y, width, height);
}

#pragma mark - 根据商品类别请求数据
- (void)loadProductListData {
    [QWProductListTool GETProductListWithcatelogyId:_catelogyId
                                               page:@"1"
                                            success:^(NSArray *productList) {
                                                [self.productList addObjectsFromArray:productList];
                                                // 记得刷新数据
                                                [self.tableView reloadData];
                                                // 显示分割线
                                                self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
                                            }
                                            failure:^(NSError *error) {
                                                NSLog(@"请求商品列表数据出错:%@", error);
                                            }];
    
}


#pragma mark - 设置导航条
- (void)setNavigationBar {
    
    // 1. 创建searchBar
    QWSearchBar *searchBar = [[QWSearchBar alloc] init];
    searchBar.placeholder = @"iPhone6s震撼来袭";
    // 2. 中间添加searchBar
    [self.navigationController.navigationBar addSubview:searchBar];
    
    // 3. 左侧返回
    self.navigationItem.leftBarButtonItem
    = [UIBarButtonItem barButtonItemWithBackgroundImage:[UIImage imageNamed:@"back_bt"]
                                       highlightedImage:nil
                                                 target:self
                                                 action:@selector(back)
                                       forControlEvents:UIControlEventTouchUpInside];
    
    // 4. 右侧切换视图布局风格
    self.navigationItem.rightBarButtonItem
    = [UIBarButtonItem barButtonItemWithBackgroundImage:[UIImage originalImageNamed:@"changeProductListGrid"]
                                       highlightedImage:nil
                                                 target:self
                                                 action:@selector(changeProductListStyle)
                                       forControlEvents:UIControlEventTouchUpInside];
    
}

#pragma mark - 添加工具条
- (void)addToolBar {
    
    QWCategoryListToolBar *toolBar = [[QWCategoryListToolBar alloc] init];
    _toolBar = toolBar;
    // 添加至导航控制器的导航条下
    [self.navigationController.view insertSubview:toolBar
                                     aboveSubview:self.navigationController.navigationBar];
    
}

#pragma mark - 返回
- (void)back {
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

#pragma mark - 切换视图布局风格
- (void)changeProductListStyle {
    
}

#pragma mark - <UITableViewDataSource>
#pragma mark  有多少组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    
    return 1;
}
#pragma mark  每组有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.productList.count;
}

#pragma mark  cell长什么样
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuseIdentifier = @"reuseIdentifier";
    QWProductCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"QWProductCell" owner:nil options:nil] lastObject];
    }
    cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage stretchableImageNamed:@"bg_white_cell"]];
    // 取出模型
    QWProduct *product = self.productList[indexPath.row];
    cell.product = product;
    
    return cell;
}
#pragma mark - <UITableViewDelegate>
#pragma mark  cell长多高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

#pragma mark 选中后做什么
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 设置选中效果
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    // 取出模型
    QWProduct *selectedProduct = self.productList[indexPath.row];
    
    // 页面跳转
    QWProductMainController *detailVC
    = [[QWProductMainController alloc] initWithSkuId:selectedProduct.skuId];
    QWNavigationController *navigationVC = [[QWNavigationController alloc] initWithRootViewController:detailVC];
    
    self.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:navigationVC animated:YES completion:nil];
}


@end
