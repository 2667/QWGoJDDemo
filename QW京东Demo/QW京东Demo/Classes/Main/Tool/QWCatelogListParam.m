//
//  QWCatelogListParam.m
//  QW京东Demo
//
//  Created by mac on 16/1/21.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "QWCatelogListParam.h"

#define QWClient        @"apple"
#define QWParamBOOL     @"true"

@implementation QWCatelogListParam

- (void)setLevel:(NSString *)level {
    
    _level = level;
    
    // 设置其他默认属性
    _isIcon = QWParamBOOL;
    _isDescription = QWParamBOOL;
    _client = QWClient;
}

@end