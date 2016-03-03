//
//  QWProductListParam.m
//  QW京东Demo
//
//  Created by mac on 16/1/21.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "QWProductListParam.h"
#define QWClient        @"apple"
#define QWPageSize      @"30"

@implementation QWProductListParam

- (void)setPage:(NSString *)page {
    
    _page = page;
    
    // 设置其他默认属性
    _pageSize = QWPageSize;
    _client = QWClient;
}

@end