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
@property (nonatomic, strong) UILabel *titleLabel;

@end


@implementation DICSwipeTabDetailCollectionViewCell
- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        //self.backgroundColor = [UIColor greenColor];
        
        self.titleLabel = [[UILabel alloc] initForAutoLayout];
        [self.contentView addSubview:self.titleLabel];
        
        

        [self.titleLabel autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(5, 5, 5, 5)];
    }
    return self;
}

- (void) updateViewByIndexPath:(NSIndexPath *)indexPath {
    self.titleLabel.text = [NSString stringWithFormat:@"%@",indexPath];
    if (indexPath.row == 0) {
        self.backgroundColor = [UIColor greenColor];
    } else if (indexPath.row == 1) {
        self.backgroundColor = [UIColor orangeColor];
    } else if (indexPath.row == 2){
        self.backgroundColor = [UIColor lightGrayColor];
    } else {
        self.backgroundColor = [UIColor blueColor];
    }
}
@end
