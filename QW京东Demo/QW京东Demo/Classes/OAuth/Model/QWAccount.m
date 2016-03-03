
//  QWAccount.m
//  QW京东Demo
//
//  Created by mac on 16/1/14.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "QWAccount.h"
#import "MJExtension.h"

#define QWAccess_tokenKey   @"access_token"
#define QWExpires_inKey     @"expires_in"
#define QWUidKey            @"uid"
#define QWExpires_dateKey   @"expires_date"


@implementation QWAccount

#pragma mark - MJExtension归档
MJCodingImplementation

// 字典转模型
+ (instancetype)accountWithDictionary:(NSDictionary *)dictionary
{
   QWAccount *account = [QWAccount objectWithKeyValues:dictionary];
    
    return account;
}

// 用KVC进行字典转模型时，会先遍历字典，找对应的模型属性，找到后再调用setter方法
// 因为expires_date的值由expires_in决定, 所以可以在expires_in的setter方法中为expires_date设值
- (void)setExpires_in:(NSString *)expires_in
{
    _expires_in = expires_in;
    
    // (登录账号授权时)计算过期时间:过期时间 = 当前时间 + 有效期
    // 注意：longLongValue
    _expires_date = [NSDate dateWithTimeIntervalSinceNow:[expires_in longLongValue]];
}



@end
