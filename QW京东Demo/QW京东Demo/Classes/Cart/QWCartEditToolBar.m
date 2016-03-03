//
//  QWCartEditToolBar.m
//  QW京东Demo
//
//  Created by mac on 16/1/21.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "QWCartEditToolBar.h"
@interface QWCartEditToolBar ()
@property (weak, nonatomic) IBOutlet UIButton *selectButton;

- (IBAction)selectAll:(id)sender;
- (IBAction)deleteProducts:(id)sender;
@end

@implementation QWCartEditToolBar

- (void)setCellItems:(NSMutableArray *)cellItems {
    _cellItems = cellItems;
    
    // 设置全选状态:初始状态就是全选
    self.selectButton.selected = YES;
    for (NSString *selection in cellItems) {
        if ([selection isEqualToString:QW_NO_string]) {
            self.selectButton.selected = NO;
        }
    }
}

#pragma mark -点击按钮
- (void)clickButton:(UIButton *)button {
    
    if ([_delegate respondsToSelector:@selector(cartToolBar:didClickButton:)]) {
        [_delegate cartToolBar:self didClickButton:button];
    }
}

- (IBAction)selectAll:(id)sender {
    [self clickButton:sender];
}

- (IBAction)deleteProducts:(id)sender {
    [self clickButton:sender];
}
@end

