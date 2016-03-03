//
//  QWProductListController.h
//  QW京东Demo
//
//  Created by mac on 16/1/21.
//  Copyright © 2016年 mac. All rights reserved.
//    商品列表  点击二级菜单 得到的三级菜单

#import <UIKit/UIKit.h>

@interface QWProductListController : UITableViewController

/**
 *  创建并返回一个SCProductListController对象,需要传入catelogyId参数进行数据请求
 *
 *  @param catelogyId 商品类别编号cid
 *
 *  @return 一个QWProductListController对象
 */
- (instancetype)initWithCatelogyId:(NSString *)catelogyId;



@end
