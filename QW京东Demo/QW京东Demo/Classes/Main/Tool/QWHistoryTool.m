//
//  QWHistoryTool.m
//  QW京东Demo
//
//  Created by mac on 16/1/21.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "QWHistoryTool.h"
#define QWHistoryKey @"HistoryKey"

@implementation QWHistoryTool

+ (void)saveNewHistory:(QWProductInfo *)productInfo {
    if (productInfo == nil) { return; }
    
    // 取出所有历史记录
    NSMutableArray *history = [NSMutableArray arrayWithArray:[self history]];
    if (history.count) {
        for (NSDictionary *productDic in history) {
            QWProductInfo *productObj = [QWProductInfo objectWithKeyValues:productDic]; // 字典转模型
            if ([productObj.skuId isEqualToString:productInfo.skuId]) {
                [history removeObject:productDic];         // 删除原有的相同记录
                break;
            }
        }
    }
    // 添加新的记录
    [history insertObject:productInfo.keyValues atIndex:0];
    // 保存新记录
    [QWUserDefault setObject:history forKey:QWHistoryKey];
}

+ (NSArray *)history {
    NSArray *history = [QWUserDefault arrayForKey:QWHistoryKey];
    if (history == nil) {
        history  = [NSArray array];
    }
    return history;
}

@end