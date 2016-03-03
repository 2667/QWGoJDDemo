//
//  QWCellSelectionItem.m
//  QW京东Demo
//
//  Created by mac on 16/1/21.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "QWCellSelectionItem.h"
#import "QWCartTool.h"

@implementation QWCellSelectionItem

#pragma mark 同时设置所有cell的item的选中状态为YES
+ (NSMutableArray *)selectAllCellItems {
    
    return [self setAllItems:QW_YES_string];
}


#pragma mark 同时设置所有cell的item的选中状态为NO
+ (NSMutableArray *)deselectAllCellItems {
    
    return [self setAllItems:QW_NO_string];
}


#pragma mark 同时设置所有cell的item的选中状态
+ (NSMutableArray *)setAllItems:(NSString *)isSelected {
    
    NSMutableArray *array = [NSMutableArray array];
    for (NSUInteger i = 0; i < self.products.count; i++) {
        [array addObject:isSelected];
    }
    return array;
}

#pragma mark 取出购物车所有商品
+ (NSMutableArray *)products {
    NSMutableArray *products = [QWCartTool cart];
    return products;
}

@end