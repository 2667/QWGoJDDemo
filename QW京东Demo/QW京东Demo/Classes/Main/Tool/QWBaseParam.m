//
//  QWBaseParam.m
//  QW京东Demo
//
//  Created by mac on 16/1/15.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "QWBaseParam.h"
#import "QWAccountTool.h"
#import "QWAccount.h"

#define QW_API_Protocol_Version @"2.0"

@implementation QWBaseParam

// 解决属性名与服务器参数key不一致的问题
+ (NSDictionary *)replacedKeyFromPropertyName {
    
    // key是属性名, value是参数名
    return @{@"buy_param_json" : @"360buy_param_json"};
}

// 一旦子类调用该类方法创建对象，就会自动给属性access_token赋值
+ (instancetype)parameter
{
    QWBaseParam *baseParam = [[self alloc] init]; // 注意：这里是基类,必须用self, 而不能用SCBaseParam,要考虑子类
    // 设置基本参数
    baseParam.access_token = [QWAccountTool account].access_token;
    baseParam.app_key = QWClient_id;
    baseParam.v = QW_API_Protocol_Version;
    
    return baseParam;
}


@end
