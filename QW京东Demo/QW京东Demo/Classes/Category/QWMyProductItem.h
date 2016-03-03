//
//  QWMyProductItem.h
//  QW京东Demo
//
//  Created by mac on 16/1/21.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QWMyProductItem : NSObject

/**
 *  是否收藏该商品
 */
@property (nonatomic, copy, getter=isFocused) NSString *focused;
/**
 *  购物车商品总数
 */
@property (nonatomic, assign) NSString *productCount;

@end