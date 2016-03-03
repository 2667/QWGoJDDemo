//
//  QWAccountParam.h
//  QW京东Demo
//
//  Created by mac on 16/1/14.
//  Copyright © 2016年 mac. All rights reserved.
//请求账号的参数模型

#import <Foundation/Foundation.h>

@interface QWAccountParam : NSObject

/**
 *  请求的类型, 固定填写authorization_code
 */
@property (nonatomic, copy) NSString *grant_type;
/**
 *  授权请求返回的授权码code
 */
@property (nonatomic, copy) NSString *code;
/**
 *  回调地址，需与注册应用里的回调地址一致
 */
@property (nonatomic, copy) NSString *redirect_uri;
/**
 *  申请应用时分配的AppKey
 */
@property (nonatomic, copy) NSString *client_id;
/**
 *  申请应用时分配的AppSecret
 */
@property (nonatomic, copy) NSString *client_secret;




@end
