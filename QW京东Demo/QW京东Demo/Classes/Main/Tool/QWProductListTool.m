//
//  QWProductListTool.m
//  QW京东Demo
//
//  Created by mac on 16/1/21.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "QWProductListTool.h"
#import "MJExtension.h"

#import "QWBaseParam.h"
#import "QWProductListParam.h"
#import "QWSearchCategoryList.h"

#define QWApiMethod     @"jingdong.ware.promotion.search.catelogy.list"

@implementation QWProductListTool

+ (AFHTTPRequestOperation *)GETProductListWithcatelogyId:(NSString *)catelogyId
                                                    page:(NSString *)page
                                                 success:(void (^)(NSArray *))success
                                                 failure:(void (^)(NSError *))failure {
    
    // 应用级参数
    QWProductListParam *productListParam = [[QWProductListParam alloc] init];
    productListParam.catelogyId = catelogyId;
    productListParam.page = page;
    
    // 系统级参数
    QWBaseParam *baseParam = [QWBaseParam parameter];
    baseParam.method = QWApiMethod;
    baseParam.buy_param_json = productListParam.JSONString;  // 模型转JSON字符串
    
    // 发送GET请求:创建并运行一个 `AFHTTPRequestOperation`队列
    AFHTTPRequestOperation *operation
    = [QWHttpTool GET:QWApiBaseURL parameters:baseParam.keyValues success:^(id responseObject) {
        
        NSDictionary *dic1 = responseObject[@"jingdong_ware_promotion_search_catelogy_list_responce"];
        NSDictionary *dic2 = dic1[@"searchCatelogyList"];
        QWSearchCatelogyList *list = [QWSearchCatelogyList objectWithKeyValues:dic2];
        if (success) {
            success(list.wareInfo);
        }
        
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
    
    return operation;
}

@end