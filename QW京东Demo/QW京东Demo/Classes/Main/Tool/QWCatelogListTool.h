//
//  QWCatelogListTool.h
//  QW京东Demo
//
//  Created by mac on 16/1/21.
//  Copyright © 2016年 mac. All rights reserved.
//  请求最高级分类列表的工具

#import <Foundation/Foundation.h>
#import "QWHttpTool.h"

@interface QWCatelogListTool : NSObject
/**
 *  获取一级分类列表信息
 *
 *  @param level      类目分类
 *  @param catelogyId 类目编号
 *  @param success    请求成功时调用
 *  @param failure    请求失败时调用
 *
 *  @return 发出请求的队列
 */
+ (AFHTTPRequestOperation *)GETCatelogyListWithLevel:(NSString *)level
                                          catelogyId:(NSString *)catelogyId
                                             success:(void (^)(NSArray *catelogyList))success
                                             failure:(void (^)(NSError *error))failure;


@end