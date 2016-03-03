//
//  QWCatelogListTool.m
//  QW京东Demo
//
//  Created by mac on 16/1/21.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "QWCatelogListTool.h"

#import "MJExtension.h"

#import "QWBaseParam.h"
#import "QWCatelogListParam.h"
#import "QWCatelogyListResponse.h"

#define QWApiMethod     @"jingdong.ware.product.catelogy.list.get"

@implementation QWCatelogListTool

+ (AFHTTPRequestOperation *)GETCatelogyListWithLevel:(NSString *)level
                                          catelogyId:(NSString *)catelogyId
                                             success:(void (^)(NSArray *))success
                                             failure:(void (^)(NSError *))failure {
    
    // 应用级参数
    QWCatelogListParam *catelogListParam = [[QWCatelogListParam alloc] init];
    catelogListParam.level = level;
    catelogListParam.catelogyId = catelogyId;
    
    // 系统级参数
    QWBaseParam *baseParam = [QWBaseParam parameter];
    baseParam.method = QWApiMethod;
    baseParam.buy_param_json = catelogListParam.JSONString;  // 模型转JSON字符串
    
    
    // 发送GET请求:创建并运行一个 `AFHTTPRequestOperation`队列
    AFHTTPRequestOperation *operation
    = [QWHttpTool GET:QWApiBaseURL parameters:baseParam.keyValues success:^(id responseObject) { //请求成功时执行这个success block 中的代码
        
        NSDictionary *dic1 = responseObject[@"jingdong_ware_product_catelogy_list_get_responce"];
        NSDictionary *dic2 = dic1[@"productCatelogyList"];
        // 字典转模型
        QWCatelogyListResponse *catelogyList = [QWCatelogyListResponse objectWithKeyValues:dic2];
        
        if (success) {
            success(catelogyList.catelogyList);
        }
        
    } failure:^(NSError *error) { //请求失败时执行这个failure
        
        if (failure) {
            failure(error);
        }
    }];
    
    return operation;
}

@end