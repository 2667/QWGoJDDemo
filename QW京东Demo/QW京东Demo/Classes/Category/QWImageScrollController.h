//
//  QWImageScrollController.h
//  QW京东Demo
//
//  Created by mac on 16/1/16.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QWImageScrollController : UICollectionViewController


/**
 *  当前所在页码
 */
@property (nonatomic, copy) NSString *currentPageNum;



/**
 *  创建并返回一个SCImageScrollController对象, 并配置了cell尺寸和图片内容
 *
 *  @param itemSize cell的大小
 *
 *  @param imagePaths 要显示的图片的URL
 *
 *  @return 一个SCImageScrollController对象
 */
- (instancetype)initWithItemSize:(CGSize)itemSize imagePaths:(NSArray *)imagePaths;

@end
