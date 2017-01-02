//
//  DICSwipeCollectionViewLayout.m
//  DICSwipeTabView
//
//  Created by GAOCE on 2017/1/2.
//  Copyright © 2017年 GAOCE. All rights reserved.
//

#import "DICSwipeCollectionViewLayout.h"

static const CGFloat ItemHW = 50;

@implementation DICSwipeCollectionViewLayout

- (instancetype)init {
    if (self = [super init]) {
        
    }
    return self;
}


- (void)prepareLayout {
    [super prepareLayout];
    
    //初始化每个 cell 的尺寸
    self.itemSize = CGSizeMake(ItemHW*3, ItemHW);
    self.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    //设置水平滚动
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.minimumLineSpacing = 0;//ItemHW * 0.3;
}




@end
