//
//  QWBaseCell.h
//  QW京东Demo
//
//  Created by mac on 16/1/15.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QWProductInfo.h"

@interface QWBaseCell : UITableViewCell

/**
 *  商品的详细信息模型
 */
@property (nonatomic, strong) QWProductInfo *productInfo;

/**
 *  设置cell要显示的图片URL和真实高度
 *
 *  @param imagePaths 商品配图URL(NSString)
 *
 *  @param  cellHeight cell的真实高度
 */
- (void)setImagePaths:(NSArray *)imagePaths cellHeight:(CGFloat)cellHeight;

@end