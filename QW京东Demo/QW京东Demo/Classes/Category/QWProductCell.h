//
//  QWProductCell.h
//  QW京东Demo
//
//  Created by mac on 16/1/21.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QWProduct.h"

@interface QWProductCell : UITableViewCell

/**
 *  商品基本信息
 */
@property (nonatomic, strong)QWProduct *product;

@end
