//
//  QWImageScrollBaseCell.m
//  QW京东Demo
//
//  Created by mac on 16/1/16.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "QWImageScrollBaseCell.h"
#import "UIImageView+WebCache.h"

@interface QWImageScrollBaseCell ()

// 显示的图片
@property (nonatomic, weak) UIImageView *imageView;

@end

@implementation QWImageScrollBaseCell

#pragma mark - 懒加载
- (UIImageView *)imageView
{
    if (_imageView == nil) {
        
        UIImageView *tempImageView = [[UIImageView alloc] initWithFrame:self.contentView.bounds];
        
        _imageView = tempImageView;
        // 注意：一定要加载到contentView上，如果加载到view上则有可能被遮住
        [self.contentView addSubview:tempImageView];
    }
    
    return _imageView;
}

#pragma mark -重写set方法
- (void)setImage:(UIImage *)image {
    
    _image = image;
    
    self.imageView.image = image;
}

- (void)setImagePath:(NSURL *)imagePath {
    
    _imagePath = imagePath;
    
    [self.imageView sd_setImageWithURL:imagePath
                      placeholderImage:[UIImage imageNamed: @"act_bg_view"]];
}

@end