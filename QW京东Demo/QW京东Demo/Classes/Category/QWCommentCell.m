//
//  QWCommentCell.m
//  QW京东Demo
//
//  Created by mac on 16/1/17.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "QWCommentCell.h"


@interface QWCommentCell ()
@property (weak, nonatomic) IBOutlet UILabel *goodPercentage;
@property (weak, nonatomic) IBOutlet UILabel *commentCount;

@end

@implementation QWCommentCell

- (void)setProductInfo:(QWProductInfo *)productInfo {
    [super setProductInfo:productInfo];
    
    // 好评率
    _goodPercentage.text = productInfo.good;
    
    // 评论数
    NSString *count = @"";
    if (productInfo.totalCount) {
        count = [NSString stringWithString:productInfo.totalCount];
        count = [count stringByReplacingOccurrencesOfString:@"," withString:@""];
    }
    _commentCount.text =  [count stringByAppendingString:@"人评论"];
}


@end