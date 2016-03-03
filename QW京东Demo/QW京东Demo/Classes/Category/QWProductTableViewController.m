//
//  QWProductTableViewController.m
//  QW京东Demo
//
//  Created by mac on 16/1/15.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "QWProductTableViewController.h"

#import "QWProductCellCommon.h"


#import "QWProductDetailList.h"
#import "QWProductImagePath.h"
#import "QWProductInfo.h"

#import "QWProductInfoTool.h"

@interface QWProductTableViewController ()

// 商品编号skuId
@property (nonatomic, copy) NSString *skuId;
// 商品配图URL(NSString)
@property (nonatomic, strong) NSMutableArray *imagePaths;
// 商品详细信息
@property (nonatomic, strong) QWProductInfo *productInfo;
// 各个cell的nibName
@property (nonatomic, strong) NSArray *nibNames;

@end

@implementation QWProductTableViewController
{
    CGFloat cellHeight[5];
}

#pragma mark - 懒加载
- (NSMutableArray *)imagePaths {
    if (_imagePaths == nil) {
        _imagePaths = [NSMutableArray array];
    }
    return _imagePaths;
}

- (NSArray *)nibNames {
    if (_nibNames == nil) {
        _nibNames = @[NSStringFromClass([QWImageCell class]),
                      NSStringFromClass([QWNamePriceCell class]),
                      NSStringFromClass([QWSelectionSkuCell class]),
                      NSStringFromClass([QWServiceCell class]),
                      NSStringFromClass([QWCommentCell class])];
    }
    return _nibNames;
}

#pragma mark -初始化
- (instancetype)initWithSkuId:(NSString *)skuId {
    self = [super initWithStyle:UITableViewStylePlain];
    
    if (self) {
        _skuId = skuId;
        // 计算行高
        [self calculateCellHeightForAllRows];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置tableView
    self.tableView.tableFooterView = [[UIView alloc] init];    //不显示空的cell
    // 请求数据
    [self loadProductDetailInfoData];
}

#pragma mark - 计算行高
- (void)calculateCellHeightForAllRows {
    cellHeight[0] = 350;
    cellHeight[1] = 140;
    cellHeight[2] = 50;
    cellHeight[3] = 140;
    cellHeight[4] = 60;
}

#pragma mark - 请求数据
- (void)loadProductDetailInfoData {
    
    [QWProductInfoTool GETProductInfoWithSkuId:_skuId success:^(QWProductDetailList *productInfoList) {
        
        for (QWProductImagePath *imagePathObj in productInfoList.imagePaths) {
            [self.imagePaths addObject:imagePathObj.bigpath];
        }
        // 修改价格显示格式
        [productInfoList.productInfo editJDPriceFormat];
        // 取值
        _productInfo = productInfoList.productInfo;
        
        [self.tableView reloadData];
        // 通知SCProductMainController
        [[NSNotificationCenter defaultCenter] postNotificationName:QWProductInfoDidRecievedNotification object:productInfoList.productInfo];
        
    } failure:^(NSError *error) {
        QWLog(@"请求商品详细数据出错!%@", error);
    }];
}

#pragma mark - <UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.nibNames.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *reuseIdentifier = @"reuseIdentifier";
    QWBaseCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:self.nibNames[indexPath.row] owner:nil options:nil] lastObject];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    // 传入模型数据
    cell.productInfo = self.productInfo;
    [cell setImagePaths:self.imagePaths cellHeight:cellHeight[indexPath.row]];
    
    return cell;
}

#pragma mark - <UITableViewDelegate>
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return cellHeight[indexPath.row];
}

@end