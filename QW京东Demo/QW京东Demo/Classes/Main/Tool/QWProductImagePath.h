//
//  QWProductImagePath.h
//  QW京东Demo
//
//  Created by mac on 16/1/21.
//  Copyright © 2016年 mac. All rights reserved.
//   商品详细信息配图URL

#import <Foundation/Foundation.h>

@interface QWProductImagePath : NSObject

/**
 *  大图URL
 */
@property (nonatomic, copy) NSString *bigpath;
/**
 *  小图URL
 */
@property (nonatomic, copy) NSString *newpath;

@end