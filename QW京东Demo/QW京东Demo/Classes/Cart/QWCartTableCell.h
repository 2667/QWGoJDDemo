//
//  QWCartTableCell.h
//  QW京东Demo
//
//  Created by mac on 16/1/21.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QWProductInfo.h"

@class QWCartTableCell;

@protocol QWCartTableCellDelegate <NSObject>

@optional
- (void)tableViewCell:(QWCartTableCell *)cell
          atIndexPath:(NSIndexPath *)indexPath
didClickButtonAtIndex:(NSInteger)index;

@end

@interface QWCartTableCell : UITableViewCell


@property (nonatomic, weak) id <QWCartTableCellDelegate> delegate;
/**
 *  商品详细信息
 */
@property (nonatomic, strong) QWProductInfo *productInfo;
/**
 *  创建自定义的QWCartTableCell对象，同时tableView可重用该cell
 *
 *  @param tableView 重用QWCartTableCell对象的tableView
 *
 *  @return QWCartTableCell对象
 */
+ (instancetype)cellWithTableView:(UITableView *)tableView;
/**
 *  传入所有cell的被选中状态和cell的位置
 *
 *  @param cellItems 购物车中商品的被选中状态(NSString:@"YES"/@"NO")
 *  @param indexPath cell的位置
 */
- (void)setCellItems:(NSMutableArray *)cellItems forIndexPath:(NSIndexPath *)indexPath;

@end