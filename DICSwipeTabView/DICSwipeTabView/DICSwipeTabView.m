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



@interface DICSwipeTabView ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) NSArray *titleArray;

@property (nonatomic, strong) UICollectionView *topBarView;
@property (nonatomic, strong) UICollectionView *bottomDetialView;

@property (nonatomic, strong) DICSwipeCollectionViewLayout *topBarViewLayout;
@property (nonatomic, strong) DICSwipeCollectionViewLayout *bottomDetialViewLayout;

@end







@implementation DICSwipeTabView

- (instancetype) initWithTitleArray:(NSArray *)titleArray {
    self = [super initForAutoLayout];
    if (self) {
        self.titleArray = titleArray;
        [self setCollectionViewLayouts];
        [self setCollectionViews];
        
    }
    return self;
}

- (void) setCollectionViewLayouts {
    self.topBarViewLayout = [[DICSwipeCollectionViewLayout alloc] init];
    self.bottomDetialViewLayout = [[DICSwipeCollectionViewLayout alloc] init];
}

- (void) setCollectionViews {
    
    self.topBarView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width-5, 60) collectionViewLayout:self.topBarViewLayout];
    self.topBarView.collectionViewLayout = self.topBarViewLayout;
    self.topBarView.backgroundColor = [UIColor yellowColor];
    self.topBarView.tag = TopBarCollectionViewTag;
    self.topBarView.delegate = self;
    self.topBarView.dataSource = self;
    self.topBarView.scrollsToTop = NO;
    self.topBarView.showsVerticalScrollIndicator = NO;
    self.topBarView.showsHorizontalScrollIndicator = NO;
    [self addSubview:self.topBarView];
    
    
    [self.topBarView registerClass:[DICSwipeTabBarCollectionViewCell class] forCellWithReuseIdentifier:DICSwipeTabBarCollectionViewCellIdentifier];
    
    self.bottomDetialView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 130, [UIScreen mainScreen].bounds.size.width-5, 100) collectionViewLayout:self.bottomDetialViewLayout];
    self.bottomDetialView.collectionViewLayout = self.bottomDetialViewLayout;
    self.bottomDetialView.backgroundColor = [UIColor blueColor];
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

//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
//    
//    return nil;
//    
//}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = nil;
    switch (collectionView.tag) {
        case TopBarCollectionViewTag: {
            //加载顶部bar的cell
            DICSwipeTabBarCollectionViewCell *tmpCell = [collectionView dequeueReusableCellWithReuseIdentifier:DICSwipeTabBarCollectionViewCellIdentifier forIndexPath:indexPath];
            [tmpCell updateViewByStr:self.titleArray[indexPath.row]];
            cell = tmpCell;
            break;
        }
        case BottomDetialCollectionViewTag: {
            //加载底部view的cell
            DICSwipeTabDetailCollectionViewCell *tmpCell = [collectionView dequeueReusableCellWithReuseIdentifier:DICSwipeTabDetailCollectionViewCellIdentifier forIndexPath:indexPath];
            [tmpCell updateViewByIndexPath:indexPath];
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
            //标记选中，刷新veiw等操作
            //底部跟着响应的cell滑动
            
            DICSwipeTabBarCollectionViewCell *cell = (DICSwipeTabBarCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
            cell.selected = YES;

            
            [self.bottomDetialView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
            
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
            //取消标记选中
            
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
        [self.topBarView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    }
}




@end
