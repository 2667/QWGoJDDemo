//
//  QWNewFeatureCell.h
//  QW京东Demo
//
//  Created by mac on 16/1/14.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QWImageScrollBaseCell.h"

@interface QWNewFeatureCell : QWImageScrollBaseCell

/**
 *  获取当前页码和最后一页的页码
 *
 *  @param currentIndex 当前页
 *  @param lastIndex    最后一页
 */
- (void)setCurrentPageIndex:(NSInteger)currentIndex lastPageIndex:(NSInteger)lastIndex;

@end