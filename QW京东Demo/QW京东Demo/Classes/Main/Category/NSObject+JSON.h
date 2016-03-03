//
//  NSObject+JSON.h
//  QW京东Demo
//
//  Created by mac on 16/1/14.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (JSON)

/**
 *  字典或对象转成JSON字符串数据
 */
@property (nonatomic, copy, readonly) NSString *JSONString;



@end
