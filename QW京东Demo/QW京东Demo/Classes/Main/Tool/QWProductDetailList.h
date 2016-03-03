//
//  QWProductDetailList.h
//  QW京东Demo
//
//  Created by mac on 16/1/21.
//  Copyright © 2016年 mac. All rights reserved.
//  商品详细信息数据列表模型(含SCProductInfo)

#import <Foundation/Foundation.h>
#import "MJExtension.h"

#import "QWProductInfo.h"

@interface QWProductDetailList : NSObject   <MJKeyValue>

/**
 *  商品配图URL(SCProductImagePath)
 */
@property (nonatomic, strong) NSArray *imagePaths;
/**
 *  商品详细信息
 */
@property (nonatomic, strong) QWProductInfo *productInfo;

@end