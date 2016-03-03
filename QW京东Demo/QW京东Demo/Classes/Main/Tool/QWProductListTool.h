//
//  QWProductListTool.h
//  QW京东Demo
//
//  Created by mac on 16/1/21.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QWHttpTool.h"

@interface QWProductListTool : NSObject
/**
 *  根据三级类目请求商品列表数据
 *
 *  @param catelogyId 第三级类目
 *  @param success    请求成功时调用
 *  @param failure    请求失败时调用
 *
 *  @return 发出请求的队列
 */
+ (AFHTTPRequestOperation *)GETProductListWithcatelogyId:(NSString *)catelogyId
                                                    page:(NSString *)page
                                                 success:(void (^)(NSArray *productList))success
                                                 failure:(void (^)(NSError *error))failure;

@end