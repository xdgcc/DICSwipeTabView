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
        
        self.backgroundColor = [UIColor redColor];
        
        self.titleLabel = [[UILabel alloc] initForAutoLayout];
        [self.contentView addSubview:self.titleLabel];
        [self.titleLabel autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(5, 5, 5, 5)];
        
        self.lineView = [[UIView alloc] initForAutoLayout];
        self.lineView.backgroundColor = [UIColor blackColor];
        self.lineView.hidden = YES;
        [self.contentView addSubview:self.lineView];
        [self.lineView autoSetDimension:ALDimensionHeight toSize:5];
        [self.lineView autoPinEdgeToSuperviewEdge:ALEdgeLeading];
        [self.lineView autoPinEdgeToSuperviewEdge:ALEdgeTrailing];
        [self.lineView autoPinEdgeToSuperviewEdge:ALEdgeBottom];
        
        
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
