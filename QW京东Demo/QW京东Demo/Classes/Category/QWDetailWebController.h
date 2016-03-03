//
//  QWDetailWebController.h
//  QW京东Demo
//
//  Created by mac on 16/1/15.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QWDetailWebController : UIViewController

/**
 *  创建并返回一个SCDetailWebController对象,需要传入skuId参数进行数据请求
 *
 *  @param skuId 商品编号skuId
 *
 *  @return 一个SCDetailWebController对象
 */
- (instancetype)initWithSkuId:(NSString *)skuId;



@end
