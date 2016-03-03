//
//  QWCartTool.m
//  QW京东Demo
//
//  Created by mac on 16/1/18.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "QWCartTool.h"

#define QWCartKey @"CartKey"
#define QWCartCountKey @"TotalCountKey"

@implementation QWCartTool

static NSString *_totalCount;

+ (void)buyProduct:(QWProductInfo *)productInfo count:(NSString *)count {
    if (productInfo == nil) return;
    // 重新计算总量
    [self calculateTotalCountWithNewCount:count];
    
    // 取出所有已经购买的商品
    NSMutableArray *products = [NSMutableArray arrayWithArray:[QWUserDefault arrayForKey:QWCartKey]];
    if (products.count) {
        for (NSDictionary *productDic in products) {
            QWProductInfo *productObj = [QWProductInfo objectWithKeyValues:productDic]; // 字典转模型
            if ([productObj.skuId isEqualToString:productInfo.skuId]) {
                count = [NSString stringWithFormat:@"%lli", count.longLongValue + productObj.buyCount.longLongValue];      // 重新计算数量
                [products removeObject:productDic];    // 删除原有的相同记录
                break;
            }
        }
    }
    // 添加新的记录
    productInfo.buyCount = count;
    [products insertObject:productInfo.keyValues atIndex:0];
    
    [QWUserDefault setObject:products forKey:QWCartKey];
}

+ (void)buyMoreProduct:(QWProductInfo *)productInfo count:(NSString *)count {
    if (productInfo == nil) return;
    // 重新计算总量
    [self calculateTotalCountWithNewCount:count];
    
    // 取出所有已经购买的商品
    NSMutableArray *products = [NSMutableArray arrayWithArray:[QWUserDefault arrayForKey:QWCartKey]];
    if (!products.count) {
        productInfo.buyCount = count;
        [products insertObject:productInfo.keyValues atIndex:0];
        
    } else {
        NSUInteger i = 0;
        for (NSDictionary *productDic in products) {
            QWProductInfo *productObj = [QWProductInfo objectWithKeyValues:productDic]; // 字典转模型
            if ([productObj.skuId isEqualToString:productInfo.skuId]) {
                count = [NSString stringWithFormat:@"%lli", count.longLongValue + productObj.buyCount.longLongValue];      // 重新计算数量
                
                if ([count isEqualToString:@"0"]) return;
                // 添加新的记录
                productInfo.buyCount = count;
                [products replaceObjectAtIndex:i withObject:productInfo.keyValues];
                break;
            }
            i++;
        }
    }
    
    [QWUserDefault setObject:products forKey:QWCartKey];
}

+ (void)removeProductWithSkuId:(NSString *)skuId {
    // 取出所有已经购买的商品
    NSMutableArray *products = [NSMutableArray arrayWithArray:[QWUserDefault arrayForKey:QWCartKey]];
    for (NSDictionary *productDic in products) {
        QWProductInfo *productObj = [QWProductInfo objectWithKeyValues:productDic]; // 字典转模型
        if ([productObj.skuId isEqualToString:skuId]) {
            
            NSString *removeCount = [NSString stringWithFormat:@"-%@", productObj.buyCount];
            [self calculateTotalCountWithNewCount:removeCount];
            
            [products removeObject:productDic];    // 删除原有的相同记录
            break;
        }
    }
    
    [QWUserDefault setObject:products forKey:QWCartKey];
}

+ (NSMutableArray *)cart {
    NSMutableArray *cart = [NSMutableArray array];
    
    // 取出所有字典
    NSArray *products = [QWUserDefault arrayForKey:QWCartKey];
    if (!products) return cart;
    // 字典转模型
    for (NSDictionary *productDic in products) {
        QWProductInfo *productObj = [QWProductInfo objectWithKeyValues:productDic];
        [cart addObject:productObj];
    }
    return cart;
}

+ (NSString *)totalCount {
    _totalCount = [QWUserDefault stringForKey:QWCartCountKey];
    if (_totalCount == nil) {
        _totalCount = @"0";
    }
    return _totalCount;
}

+ (void)calculateTotalCountWithNewCount:(NSString *)count {
    
    NSUInteger totalCount = count.longLongValue + _totalCount.longLongValue;
    _totalCount = [NSString stringWithFormat:@"%li", totalCount];
    [QWUserDefault setObject:_totalCount forKey:QWCartCountKey];
}

@end
