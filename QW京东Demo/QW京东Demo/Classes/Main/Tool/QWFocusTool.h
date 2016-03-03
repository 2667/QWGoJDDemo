//
//  QWFocusTool.h
//  QW京东Demo
//
//  Created by mac on 16/1/15.
//  Copyright © 2016年 mac. All rights reserved.
//   存取收藏夹中商品信息的工具类


#import <Foundation/Foundation.h>
#import "QWProductInfo.h"

@interface QWFocusTool : NSObject


/**
 *  添加关注
 *
 *  @param productInfo  要保存到收藏夹中的商品信息
 */
+ (void)focusProduct:(QWProductInfo *)productInfo;



/**
 *  取消关注
 *
 *  @param skuId        要取消关注的商品编号
 *
 *  @return 更新后的收藏夹中的商品信息(SCProductInfo.keyValues)
 */
+ (NSMutableArray *)removeFocusedProductWithskuId:(NSString *)skuId;



/**
 *  读取收藏夹数据
 *
 *  @return 收藏夹中的商品信息(SCProductInfo.keyValues)
 */
+ (NSArray *)focuses;




/**
 *  判断是否已经关注了某件商品
 *
 *  @param skuId    要判断的商品编号
 *
 *  @return         是否已经关注了该商品
 */
+ (NSString *)hasFocusedProductWithSkuId:(NSString *)skuId;

@end