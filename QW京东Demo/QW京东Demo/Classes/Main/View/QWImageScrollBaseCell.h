//
//  QWImageScrollBaseCell.h
//  QW京东Demo
//
//  Created by mac on 16/1/16.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QWImageScrollBaseCell : UICollectionViewCell

/**
 *  滚动图片
 */
@property (nonatomic, strong) UIImage *image;

/**
 *  图片链接URL
 */
@property (nonatomic, strong) NSURL *imagePath;


@end
