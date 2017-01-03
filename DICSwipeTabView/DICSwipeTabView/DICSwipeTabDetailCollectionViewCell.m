//
//  DICSwipeTabDetailCollectionViewCell.m
//  DICSwipeTabView
//
//  Created by GAOCE on 2017/1/2.
//  Copyright © 2017年 GAOCE. All rights reserved.
//

#import "DICSwipeTabDetailCollectionViewCell.h"
#import "PureLayout.h"

@interface DICSwipeTabDetailCollectionViewCell ()
@property (nonatomic, strong) UIView *detialView;
@end


@implementation DICSwipeTabDetailCollectionViewCell
- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void) updateViewByDetialView:(UIView *)detialView {
    self.detialView = detialView;
    [self.contentView addSubview:self.detialView];
    [self.detialView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
}
@end
