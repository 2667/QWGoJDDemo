//
//  QWAccountTool.m
//  QW京东Demo
//
//  Created by mac on 16/1/14.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "QWAccountTool.h"
#import "QWAccount.h"

#import "QWAccountParam.h"
#import "QWHttpTool.h"

#import "MJExtension.h"

#define QWDocumentsPath         [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]
#define QWAccountFilePath       [QWDocumentsPath stringByAppendingPathComponent:@"AccountInfo.data"]

#define QWAccessTokenURL    @"https://oauth.jd.com/oauth/token"


@implementation QWAccountTool

// 类方法里一般用静态变量代替成员属性,成员变量前要加下划线
// 如果每次都创建一个对象的话，更耗内存
static QWAccount *_account;

// 保存账号信息
+ (void)saveAccount:(QWAccount *)account
{
    [NSKeyedArchiver archiveRootObject:account toFile:QWAccountFilePath];
}

// 读取账号信息
+ (QWAccount *)account
{
    // 注意：没有必要每次访问_account都读取文件, 只在打开程序时读取就OK
    if (_account == nil) {
        
        _account = [NSKeyedUnarchiver unarchiveObjectWithFile:QWAccountFilePath];
        
        // 在打开程序时判断是否过期:当前时间 < 过期时间(上一次授权时保存的)则不过期, 否则过期
        if ([[NSDate date] compare:_account.expires_date] != NSOrderedAscending) {
            return nil;
        }
    }
//    QWLog(@"账号:%@", _account.access_token);
    return _account;
}

+ (void)accountWithCode:(NSString *)code
                success:(void (^)())success
                failure:(void (^)(NSError *))failure
{
    
    // 1 设置请求参数：(参考官方的accessToken官方文档)
    QWAccountParam *postParameters = [[QWAccountParam alloc] init];
    postParameters.client_id = QWClient_id;
    postParameters.client_secret = QWClient_secret;
    postParameters.grant_type = @"authorization_code";
    postParameters.code = code;
    postParameters.redirect_uri = QWRedirect_uri;
    
    // 2 发送请求 (请求参数模型需要转成字典)
    [QWHttpTool POST:QWAccessTokenURL parameters:[postParameters keyValues]
             success:^(id responseObject) {
                 // 下载plist结果到桌面上
                 [(NSDictionary *)responseObject writeToFile:@"/Users/mac/Desktop/test.xml" atomically:YES];
                 // 获取结果参数:字典转模型
                 QWAccount *account = [QWAccount accountWithDictionary:responseObject];
                 // 保存账号信息
                 // 一般在开发中我们会经常用到业务类,也就是专门用来处理数据的存储读取，
                 // 如果以后我不想归档，想用数据库的话，直接改业务类就OK了
                 [QWAccountTool saveAccount:account];
                 
                 if (success) {
                     success();
                 }
                 
             } failure:^(NSError *error) {
                 
                 if (failure) {
                     failure(error);
                 }
             }];
}

@end
