//
//  DICSwipeTabView.h
//  DICSwipeTabView
//
//  Created by GAOCE on 2017/1/2.
//  Copyright © 2017年 GAOCE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DICSwipeTabView : UIView

- (instancetype) initWithFrame:(CGRect)frame
              withTabBarHeight:(CGFloat)tabBarHeight
        withSeparateLineHeight:(CGFloat)separateLineHeight
                withTitleArray:(NSArray *)titleArray
                 withViewArray:(NSMutableArray *)viewArray;
@end
