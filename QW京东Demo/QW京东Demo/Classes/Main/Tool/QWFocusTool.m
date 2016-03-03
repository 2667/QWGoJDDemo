//
//  QWFocusTool.m
//  QW京东Demo
//
//  Created by mac on 16/1/15.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "QWFocusTool.h"

#define QWFocusKey @"FocusKey"

@implementation QWFocusTool

+ (void)focusProduct:(QWProductInfo *)productInfo {
    if (productInfo == nil) { return; }
    
    // 移除已经关注的相同产品, 取出更新后的所有正在关注的商品
    NSMutableArray *focuses = [self removeFocusedProductWithskuId:productInfo.skuId];
    
    // 添加新的关注
    productInfo.focused = QW_YES_string;
    [focuses insertObject:productInfo.keyValues atIndex:0];
    
    // 保存新记录
    [QWUserDefault setObject:focuses forKey:QWFocusKey];
    QWLog(@"关注%@", focuses);
}

+ (NSMutableArray *)removeFocusedProductWithskuId:(NSString *)skuId {
    
    // 取出所有正在关注的商品
    NSMutableArray *focuses = [NSMutableArray arrayWithArray:[self focuses]];
    if (focuses.count && skuId) {
        for (NSDictionary *productDic in focuses) {
            QWProductInfo *productObj = [QWProductInfo objectWithKeyValues:productDic]; // 字典转模型
            
            if ([productObj.skuId isEqualToString:skuId]) {
                [focuses removeObject:productDic];     // 移除指定商品
                [QWUserDefault setObject:focuses forKey:QWFocusKey]; // 保存更改
                break;
            }
        }
    }
    
    return focuses;
}

+ (NSArray *)focuses {
    NSArray *focuses = [QWUserDefault arrayForKey:QWFocusKey];
    if (focuses == nil) {
        focuses = [NSArray array];
    }
    return focuses;
}

+ (NSString *)hasFocusedProductWithSkuId:(NSString *)skuId {
    NSString *focus = @"";
    NSArray *focuses = [QWFocusTool focuses];
    for (NSDictionary *product in focuses) {
        QWProductInfo *productInfo = [QWProductInfo objectWithKeyValues:product]; // 字典转模型
        if ([skuId isEqualToString:productInfo.skuId]) {
            focus = QW_YES_string;
        }
    }
    
    
    return focus;
}

@end