//
//  UIImage+Extension.h
//  QW京东Demo
//
//  Created by mac on 16/1/14.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)


/**
 *  根据图片名参数创建一个UIImage对象，并返回不渲染的原图
 *
 *  @param imageName 图片路径名
 *
 *  @return 没有经过渲染的原图
 */
+ (instancetype)originalImageNamed:(NSString *)imageName;

/**
 *  根据图片名参数创建一个UIImage对象，并将原图的高宽缩小1/2
 *
 *  @param imageName 图片路径名
 *
 *  @return 高宽为原图1/2的图片
 */
+ (instancetype)stretchableImageNamed:(NSString *)imageName;





@end
