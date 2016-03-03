//
//  QWAccountTool.h
//  QW京东Demo
//
//  Created by mac on 16/1/14.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@class QWAccount;
@interface QWAccountTool : NSObject


/**
 *  保存账号信息(归档)
 *
 *  @param account 一个遵守NSCoding协议的SCAccount对象
 */
+ (void)saveAccount:(QWAccount *)account;

/**
 *  读取账号信息(解档)
 *
 *  @return 一个遵守NSCoding协议的SCAccount对象
 */
+ (QWAccount *)account;
/**
 *  获取accessToken并保存至preference
 *
 *  @param code    调用authorize获得的code值
 *  @param success 获取accessToken成功时回调的block
 *  @param failure 获取accessToken失败时回调的block
 */
+ (void)accountWithCode:(NSString *)code
                success:(void (^)())success
                failure:(void (^)(NSError *error))failure;



@end
