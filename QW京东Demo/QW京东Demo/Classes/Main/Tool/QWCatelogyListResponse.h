//
//  QWCatelogyListResponse.h
//  QW京东Demo
//
//  Created by mac on 16/1/21.
//  Copyright © 2016年 mac. All rights reserved.
//  返回的最高级分类信息

#import <Foundation/Foundation.h>
#import "MJExtension.h"

@interface QWCatelogyListResponse : NSObject <MJKeyValue>
/**
 *  最高级分类列表(category)
 */
@property (nonatomic, strong) NSArray *catelogyList;

@end