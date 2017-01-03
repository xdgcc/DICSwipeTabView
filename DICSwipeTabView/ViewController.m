//
//  ViewController.m
//  DICSwipeTabView
//
//  Created by GAOCE on 2017/1/2.
//  Copyright © 2017年 GAOCE. All rights reserved.
//

#import "ViewController.h"
#import "DICSwipeTabView.h"
#import "PureLayout.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableArray *tmpViewArray = [NSMutableArray arrayWithCapacity:0];
    for (int i = 0; i < 4; ++i) {
        UIScrollView *tmpScrollView = [[UIScrollView alloc] init];
        tmpScrollView.contentSize = CGSizeMake(CGRectGetWidth(self.view.bounds), 10000);
        tmpScrollView.backgroundColor = [UIColor colorWithRed:0.4 green:0.5 blue:0.6 alpha:0.5];
        tmpScrollView.layer.borderWidth = 1;
        tmpScrollView.layer.borderColor = [UIColor blackColor].CGColor;
        [tmpViewArray addObject:tmpScrollView];
        
      
        UILabel *tmpLabel = [[UILabel alloc] init];
        tmpLabel.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 900);
        tmpLabel.backgroundColor = [UIColor greenColor];
        [tmpScrollView addSubview:tmpLabel];
        
        UIImageView *tmpImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 900, CGRectGetWidth(self.view.bounds), 200)];
        tmpImageView.backgroundColor = [UIColor purpleColor];
        [tmpScrollView addSubview:tmpImageView];
        
        tmpScrollView.contentSize = CGSizeMake(CGRectGetWidth(self.view.bounds), CGRectGetMaxY(tmpImageView.frame));
    }

    DICSwipeTabView *testView = [[DICSwipeTabView alloc] initWithFrame:CGRectMake(0, 50, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-50) withTabBarHeight:50 withSeparateLineHeight:3 withTitleArray:@[@"全部",@"评测优选",@"积分换购"]  withViewArray:tmpViewArray];
    
    [self.view addSubview:testView];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
