//
//  UICollectionViewController+QWCurrentPage.h
//  QW京东Demo
//
//  Created by mac on 16/1/16.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICollectionViewController (QWCurrentPage)


/**
 *  根据上一次的位置和滚动偏移量计算滚动停止后的页码
 *
 *  @param pageNumber   上一次的页码
 *  @param count        总页数
 *  @param offset       偏移量
 *
 *  @return 所滚到的页码
 */
- (NSUInteger)setCurrentPageNumberWithLastPageNumber:(NSUInteger)pageNumber
                                          totalCount:(NSUInteger)count
                                              offset:(CGFloat)offset;



@end
