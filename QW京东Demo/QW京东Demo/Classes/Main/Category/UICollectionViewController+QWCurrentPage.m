//
//  UICollectionViewController+QWCurrentPage.m
//  QW京东Demo
//
//  Created by mac on 16/1/16.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "UICollectionViewController+QWCurrentPage.h"

@implementation UICollectionViewController (QWCurrentPage)


- (NSUInteger)setCurrentPageNumberWithLastPageNumber:(NSUInteger)pageNumber
                                          totalCount:(NSUInteger)count
                                              offset:(CGFloat)offset {
    
    NSUInteger currentPageNumber = pageNumber;
    
    for (NSUInteger i = 0; i < count; i++) {
        if (offset == self.view.width * i) {
            currentPageNumber = i;
        }
    }
    
    return currentPageNumber;
}


@end
