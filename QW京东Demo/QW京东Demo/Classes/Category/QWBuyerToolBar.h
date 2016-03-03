//
//  QWBuyerToolBar.h
//  QW京东Demo
//
//  Created by mac on 16/1/18.
//  Copyright © 2016年 mac. All rights reserved.
//  用户购买收藏的工具栏

#import <UIKit/UIKit.h>

@class QWBuyerToolBar;
@class QWMyProductItem;

@protocol QWBuyerToolBarDelegate <NSObject>

@optional

- (void)toolBar:(QWBuyerToolBar *)toolBar didClickButtonAtIndex:(NSUInteger)index;

@end

@interface QWBuyerToolBar : UIView

@property (nonatomic, weak) id <QWBuyerToolBarDelegate> delegate;
/**
 *   反映顾客与商品关系的数据模型
 */
@property (nonatomic, strong) QWMyProductItem *item;


@end