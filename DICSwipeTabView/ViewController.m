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
    // Do any additional setup after loading the view, typically from a nib.
    
    DICSwipeTabView *testView = [[DICSwipeTabView alloc] initWithFrame:CGRectMake(0, 50, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-50) withTabBarHeight:50 withSeparateLineHeight:5 withTitleArray:@[@"xixi",@"hehe",@"haha"]  withViewArray:nil];
    
    [self.view addSubview:testView];
    
    //[testView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
