//
//  QWCategoryListToolBar.h
//  QW京东Demo
//
//  Created by mac on 16/1/21.
//  Copyright © 2016年 mac. All rights reserved.
//  导航条下方的工具条

#import <UIKit/UIKit.h>

@class QWCategoryListToolBar;

@protocol QWCategoryListToolBarDelegate <NSObject>

@optional

- (void)categoryListToolBar:(QWCategoryListToolBar *)toolBar didClickButtonAtIndex:(NSUInteger)index;

@end

@interface QWCategoryListToolBar : UIImageView

@property (nonatomic, weak) id <QWCategoryListToolBarDelegate> delegate;

@end