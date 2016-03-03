//
//  QWCartEditToolBar.h
//  QW京东Demo
//
//  Created by mac on 16/1/21.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol QWCartEditToolbarDelegate <NSObject>

@optional
- (void)cartToolBar:(UIView *)toolBar didClickButton:(UIButton *)button;

@end

@interface QWCartEditToolBar : UIView

/**
 *  购物车中商品的被选中状态(NSString:@"YES"/@"NO")
 */
@property (nonatomic, strong) NSMutableArray *cellItems;

@property (nonatomic, weak) id <QWCartEditToolbarDelegate> delegate;

@end