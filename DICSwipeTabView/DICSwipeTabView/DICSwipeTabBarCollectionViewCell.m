//
//  DICSwipeTabBarCollectionViewCell.m
//  DICSwipeTabView
//
//  Created by GAOCE on 2017/1/2.
//  Copyright © 2017年 GAOCE. All rights reserved.
//

#import "DICSwipeTabBarCollectionViewCell.h"
#import "PureLayout.h"

@interface DICSwipeTabBarCollectionViewCell ()
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) UILabel *titleLabel;
@end

@implementation DICSwipeTabBarCollectionViewCell
- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.contentView.backgroundColor = [UIColor whiteColor];
        
        self.titleLabel = [[UILabel alloc] initForAutoLayout];
        [self.contentView addSubview:self.titleLabel];
        [self.titleLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        [self.titleLabel autoAlignAxisToSuperviewAxis:ALAxisVertical];
        
        self.lineView = [[UIView alloc] initForAutoLayout];
        self.lineView.backgroundColor = [UIColor colorWithRed:151/255.0f green:151/255.0f blue:151/255.0f alpha:1];
        self.lineView.hidden = YES;
        [self.contentView addSubview:self.lineView];
        [self.lineView autoSetDimension:ALDimensionHeight toSize:3];
        [self.lineView autoPinEdge:ALEdgeLeading toEdge:ALEdgeLeading ofView:self.titleLabel withOffset:-10];
        [self.lineView autoPinEdge:ALEdgeTrailing toEdge:ALEdgeTrailing ofView:self.titleLabel withOffset:10];
        [self.lineView autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:5];
    }
    return self;
}

- (void) updateViewByStr:(NSString *)title {
    self.titleLabel.text = title;
}


- (void)setSelected:(BOOL)selected {
    self.lineView.hidden = !selected;
}

@end
