//
//  QWProductMainController.h
//  QW京东Demo
//
//  Created by mac on 16/1/18.
//  Copyright © 2016年 mac. All rights reserved.
//   商品详细信息页面
#import <UIKit/UIKit.h>

@interface QWProductMainController : UICollectionViewController

/**
 *  创建并返回一个SCProductMainController对象,需要传入skuId参数进行数据请求
 *
 *  @param skuId 商品编号skuId
 *
 *  @return 一个SCProductMainController对象
 */
- (instancetype)initWithSkuId:(NSString *)skuId;


@end
