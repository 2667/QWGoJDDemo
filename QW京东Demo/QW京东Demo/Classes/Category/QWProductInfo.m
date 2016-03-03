//
//  QWProductInfo.m
//  QW京东Demo
//
//  Created by mac on 16/1/15.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "QWProductInfo.h"
#import "QWFocusTool.h"

@implementation QWProductInfo

- (void)editJDPriceFormat {
    
    NSRange range = [_jdPrice rangeOfString:@"."];
    if (range.length > 0) {
        NSString *str = [_jdPrice substringFromIndex:range.location]; // 截取小数部分
        
        if (str.length == 3) {                      // 补充最后的一位0
            _jdPrice = [NSString stringWithFormat:@"%@0", _jdPrice];
        }
        
    } else {                                        // 补充小数部分
        _jdPrice = [NSString stringWithFormat:@"%@.00", _jdPrice];
        
    }
    _jdPrice = [NSString stringWithFormat:@"￥%@", _jdPrice];
}

@end