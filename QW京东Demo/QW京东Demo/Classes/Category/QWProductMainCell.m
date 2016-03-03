//
//  QWProductMainCell.m
//  QW京东Demo
//
//  Created by mac on 16/1/18.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "QWProductMainCell.h"

@implementation QWProductMainCell

-(void)setContentSubview:(UIView *)contentSubview {
    if (_contentSubview) {
        [_contentSubview removeFromSuperview];   // 移除之前的内容视图
    }
    _contentSubview = contentSubview;
    [self.contentView addSubview:contentSubview];
}


@end
