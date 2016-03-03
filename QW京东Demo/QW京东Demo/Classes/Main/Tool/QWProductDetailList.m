//
//  QWProductDetailList.m
//  QW京东Demo
//
//  Created by mac on 16/1/21.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "QWProductDetailList.h"
#import "QWProductImagePath.h"

@implementation QWProductDetailList

// 协议方法：实现这个方法，就可以把字典中的字典数组转化成模型数组
// 否则，在转成SCProductDetailList模型时，不知道数组中的字典对应哪个模型
+ (NSDictionary *)objectClassInArray
{
    return @{@"imagePaths" : [QWProductImagePath class]};
}

@end