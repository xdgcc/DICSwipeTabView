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
    }
    return self;
}

- (void) updateViewByStr:(NSString *)title {
    self.titleLabel.text = title;
}

@end
