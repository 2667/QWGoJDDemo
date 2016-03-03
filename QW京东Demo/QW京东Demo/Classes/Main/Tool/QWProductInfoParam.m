//
//  QWProductInfoParam.m
//  QW京东Demo
//
//  Created by mac on 16/1/21.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "QWProductInfoParam.h"

#define QWIsLoadWareScore   @"true"
#define QWClient            @"apple"

@implementation QWProductInfoParam

- (void)setSkuId:(NSString *)skuId {
    
    _skuId = skuId;
    
    _isLoadWareScore = QWIsLoadWareScore;
    _client = QWClient;
}

@end