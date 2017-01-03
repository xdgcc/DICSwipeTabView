//
//  DICSwipeTabView.m
//  DICSwipeTabView
//
//  Created by GAOCE on 2017/1/2.
//  Copyright © 2017年 GAOCE. All rights reserved.
//

#import "DICSwipeTabView.h"
#import "PureLayout.h"
#import "DICSwipeTabBarCollectionViewCell.h"
#import "DICSwipeTabDetailCollectionViewCell.h"
#import "DICSwipeCollectionViewLayout.h"

#define TopBarCollectionViewTag 1000
#define BottomDetialCollectionViewTag 1001

static NSString *DICSwipeTabBarCollectionViewCellIdentifier = @"DICSwipeTabBarCollectionViewCell";
static NSString *DICSwipeTabDetailCollectionViewCellIdentifier = @"DICSwipeTabDetailCollectionViewCell";


@interface DICSwipeTabView ()<UICollectionViewDelegate,UICollectionViewDataSource,UIScrollViewDelegate>

@property (nonatomic, strong) NSArray *titleArray;
@property (nonatomic, strong) NSMutableArray *viewArray;

@property (nonatomic, assign) NSInteger tabCount;
@property (nonatomic, assign) CGFloat tabBarHeight;
@property (nonatomic, assign) CGFloat separateLineHeight;
@property (nonatomic, assign) CGFloat detialViewHeight;

@property (nonatomic, strong) UICollectionView *topBarView;
@property (nonatomic, strong) UICollectionView *bottomDetialView;

@property (nonatomic, strong) DICSwipeCollectionViewLayout *topBarViewLayout;
@property (nonatomic, strong) DICSwipeCollectionViewLayout *bottomDetialViewLayout;

@property (nonatomic, strong) NSIndexPath *formerIndexPath;
@property (nonatomic, strong) NSIndexPath *currentIndexPath;

@end


@implementation DICSwipeTabView

- (instancetype) initWithFrame:(CGRect)frame withTabBarHeight:(CGFloat)tabBarHeight withSeparateLineHeight:(CGFloat)separateLineHeight withTitleArray:(NSArray *)titleArray withViewArray:(NSMutableArray *)viewArray {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor colorWithRed:239/255.0f green:239/255.0f blue:244/255.0f alpha:1];
        
        self.tabBarHeight = tabBarHeight;
        self.separateLineHeight = separateLineHeight;
        self.detialViewHeight = frame.size.height - tabBarHeight - separateLineHeight;
        self.titleArray = titleArray;
        self.viewArray = viewArray;
        self.tabCount = (titleArray.count > 3) ? 3: titleArray.count;
        [self setCollectionViewLayouts];
        [self setCollectionViews];
        
    }
    return self;
}

- (void) setCollectionViewLayouts {
    self.topBarViewLayout = [[DICSwipeCollectionViewLayout alloc] initWithItemSize:CGSizeMake(self.frame.size.width/self.tabCount, self.tabBarHeight)];
    self.bottomDetialViewLayout = [[DICSwipeCollectionViewLayout alloc] initWithItemSize:CGSizeMake(self.frame.size.width, self.detialViewHeight)];
}

- (void) setCollectionViews {
    self.topBarView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.tabBarHeight) collectionViewLayout:self.topBarViewLayout];
    self.topBarView.collectionViewLayout = self.topBarViewLayout;
    self.topBarView.tag = TopBarCollectionViewTag;
    self.topBarView.delegate = self;
    self.topBarView.dataSource = self;
    self.topBarView.scrollsToTop = NO;
    self.topBarView.showsVerticalScrollIndicator = NO;
    self.topBarView.showsHorizontalScrollIndicator = NO;
    [self addSubview:self.topBarView];
    
    [self.topBarView registerClass:[DICSwipeTabBarCollectionViewCell class] forCellWithReuseIdentifier:DICSwipeTabBarCollectionViewCellIdentifier];
    
    self.bottomDetialView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, self.separateLineHeight + self.tabBarHeight, self.frame.size.width, self.detialViewHeight) collectionViewLayout:self.bottomDetialViewLayout];
    self.bottomDetialView.collectionViewLayout = self.bottomDetialViewLayout;
    self.bottomDetialView.pagingEnabled = YES;
    self.bottomDetialView.tag = BottomDetialCollectionViewTag;
    self.bottomDetialView.delegate = self;
    self.bottomDetialView.dataSource = self;
    self.bottomDetialView.scrollsToTop = NO;
    self.bottomDetialView.showsVerticalScrollIndicator = NO;
    self.bottomDetialView.showsHorizontalScrollIndicator = NO;
    [self addSubview:self.bottomDetialView];
    
    [self.bottomDetialView registerClass:[DICSwipeTabDetailCollectionViewCell class] forCellWithReuseIdentifier:DICSwipeTabDetailCollectionViewCellIdentifier];
}

#pragma mark - datasource & delegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.titleArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = nil;
    switch (collectionView.tag) {
        case TopBarCollectionViewTag: {
            DICSwipeTabBarCollectionViewCell *tmpCell = [collectionView dequeueReusableCellWithReuseIdentifier:DICSwipeTabBarCollectionViewCellIdentifier forIndexPath:indexPath];
            [tmpCell updateViewByStr:self.titleArray[indexPath.row]];
            cell = tmpCell;
            break;
        }
        case BottomDetialCollectionViewTag: {
            DICSwipeTabDetailCollectionViewCell *tmpCell = [collectionView dequeueReusableCellWithReuseIdentifier:DICSwipeTabDetailCollectionViewCellIdentifier forIndexPath:indexPath];
            [tmpCell updateViewByDetialView:self.viewArray[indexPath.row]];
            cell = tmpCell;
            break;
        }
        default:
            break;
    }
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    switch (collectionView.tag) {
        case TopBarCollectionViewTag: {
            DICSwipeTabBarCollectionViewCell *cell = (DICSwipeTabBarCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
            cell.selected = YES;
            [self.bottomDetialView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
            break;
        }
        case BottomDetialCollectionViewTag: {
            break;
        }
        default:
            break;
    }
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    switch (collectionView.tag) {
        case TopBarCollectionViewTag: {
            DICSwipeTabBarCollectionViewCell *cell = (DICSwipeTabBarCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
            cell.selected = NO;
            break;
        }
        case BottomDetialCollectionViewTag: {
            break;
        }
        default:
            break;
    }
}


- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    if (collectionView.tag == BottomDetialCollectionViewTag) {
        [self.topBarView selectItemAtIndexPath:indexPath animated:YES scrollPosition:UICollectionViewScrollPositionCenteredHorizontally];
        [self.topBarView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
    }
}


- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    CGPoint pInView = [self convertPoint:self.bottomDetialView.center toView:self.bottomDetialView];
    NSIndexPath *indexPathNow = [self.bottomDetialView indexPathForItemAtPoint:pInView];
    self.formerIndexPath = indexPathNow;
    [self.topBarView selectItemAtIndexPath:self.formerIndexPath animated:YES scrollPosition:UICollectionViewScrollPositionCenteredHorizontally];
    [self.topBarView scrollToItemAtIndexPath:self.formerIndexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGPoint pInView = [self convertPoint:self.bottomDetialView.center toView:self.bottomDetialView];
    NSIndexPath *indexPathNow = [self.bottomDetialView indexPathForItemAtPoint:pInView];
    self.currentIndexPath = indexPathNow;
    [self.topBarView selectItemAtIndexPath:self.currentIndexPath animated:YES scrollPosition:UICollectionViewScrollPositionCenteredHorizontally];
    [self.topBarView scrollToItemAtIndexPath:self.currentIndexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
}




@end
