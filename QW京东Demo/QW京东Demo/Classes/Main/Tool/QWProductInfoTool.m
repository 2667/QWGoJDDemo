//
//  QWProductInfoTool.m
//  QW京东Demo
//
//  Created by mac on 16/1/21.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "QWProductInfoTool.h"
#import "MJExtension.h"

#import "QWBaseParam.h"
#import "QWProductInfoParam.h"

#define QWApiMethod     @"jingdong.ware.product.detail.search.list.get"

@implementation QWProductInfoTool

+ (AFHTTPRequestOperation *)GETProductInfoWithSkuId:(NSString *)skuId
                                            success:(void (^)(QWProductDetailList *))success
                                            failure:(void (^)(NSError *))failure {
    
    // 应用级参数
    QWProductInfoParam *productInfoParam = [[QWProductInfoParam alloc] init];
    productInfoParam.skuId = skuId;
    
    // 系统级参数
    QWBaseParam *baseParam = [QWBaseParam parameter];
    baseParam.method = QWApiMethod;
    baseParam.buy_param_json = productInfoParam.JSONString;  // 模型转JSON字符串
    
    // 发送GET请求:创建并运行一个 `AFHTTPRequestOperation`队列
    AFHTTPRequestOperation *operation
    = [QWHttpTool GET:QWApiBaseURL parameters:baseParam.keyValues success:^(id responseObject) {
        
        NSDictionary *dic1 = responseObject[@"jingdong_ware_product_detail_search_list_get_responce"];
        NSDictionary *dic2 = dic1[@"productDetailList"];
        QWProductDetailList *productDetailList = [QWProductDetailList objectWithKeyValues:dic2];
        
        if (success) {
            success(productDetailList);
        }
        
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
    
    return operation;
}

@end