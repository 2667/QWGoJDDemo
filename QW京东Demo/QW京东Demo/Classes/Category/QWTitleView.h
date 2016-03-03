//
//  QWTitleView.h
//  QW京东Demo
//
//  Created by mac on 16/1/18.
//  Copyright © 2016年 mac. All rights reserved.
//  导航条上的按钮

#import <UIKit/UIKit.h>
@class QWTitleView;

@protocol QWTitleViewDelegate <NSObject>

@optional

- (void)titleView:(QWTitleView *)titleView didClickButtonAtIndex:(NSUInteger)index;

@end

@interface QWTitleView : UIView

@property (nonatomic, weak) id <QWTitleViewDelegate> delegate;

@end