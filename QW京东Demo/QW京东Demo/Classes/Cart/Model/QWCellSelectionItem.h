//
//  QWCellSelectionItem.h
//  QW京东Demo
//
//  Created by mac on 16/1/21.
//  Copyright © 2016年 mac. All rights reserved.
//  记录所有cell的选中状态

#import <Foundation/Foundation.h>

@interface QWCellSelectionItem : NSObject

/**
 *  全选：同时设置所有cell的item的选中状态为YES
 *
 *  @return 所有cell的item的选中状态
 */
+ (NSMutableArray *)selectAllCellItems;

/**
 *  全不选：同时设置所有cell的item的选中状态为NO
 *
 *  @return 所有cell的item的选中状态
 */
+ (NSMutableArray *)deselectAllCellItems;

@end