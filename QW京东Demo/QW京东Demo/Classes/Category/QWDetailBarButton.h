//
//  QWDetailBarButton.h
//  QW京东Demo
//
//  Created by mac on 16/1/18.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QWMyProductItem.h"

@interface QWDetailBarButton : UIButton

/**
 *   反映顾客与商品关系的数据模型
 */
@property (nonatomic, strong) QWMyProductItem *item;

/**
 *  创建并返回一个SCDetailBarButton对象,需要传入tag参数进行标签设置
 *
 *  @param tag button的标签编号
 *
 *  @return 一个SCDetailBarButton对象
 */
+ (instancetype)buttonWithTag:(NSUInteger)tag;

@end
