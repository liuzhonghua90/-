//
//  ContentView.m
//  仿今日头条首页
//
//  Created by LIANGKUNLIN on 2017/8/28.
//  Copyright © 2017年 meilixun. All rights reserved.
//

#import "ContentView.h"
#import "TitleScv.h"
#import "ContentCollectionViewCell.h"



#define screemW ([UIScreen mainScreen].bounds.size.width)
#define screemH ([UIScreen mainScreen].bounds.size.height)
#define titleViewH (40)
#define titleViewW (50)
@interface ContentView()<TitleScvDelegate,UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, strong) TitleScv *titleView;
@property (nonatomic, strong) NSMutableArray *viewControllerArray;
@property (nonatomic, strong) UICollectionView *containerView;

@end

@implementation ContentView

-(TitleScv *)titleView
{
    if (!_titleView) {
        _titleView = [[TitleScv alloc] initWithFrame:CGRectMake(0, 0, screemW, titleViewW)];
        _titleView.btnDelegate = self;
        _titleView.showsHorizontalScrollIndicator = NO;
    }
    return _titleView;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self createUI];
        
    }
    return self;
}

-(void)createUI
{
    self.backgroundColor = [UIColor grayColor];
    [self addSubview:self.titleView];
    [self addSubview:self.containerView];
    
    
}

#pragma mark - delegate 点击按钮滚动collectionview
-(void)TitleScvDelegateButtonSelectedIndex:(NSInteger)selectedIndex
{
    NSLog(@"containerView---%ld",self.containerView.subviews.count);
    self.containerView.contentOffset = CGPointMake(selectedIndex * screemW, 0);
}

-(void)createViewController:(UIViewController *)controller
{
    [self.titleView buttonName:controller.title];
    [self.viewControllerArray addObject:controller];
    [self.containerView reloadData];
}

-(void)selectedItem
{
    
}

-(void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self.titleView setBtnSelectedIndex:indexPath.item];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.viewControllerArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ContentCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.ctr = self.viewControllerArray[indexPath.row];
    return cell;
}

-(UICollectionView *)containerView
{
    if (!_containerView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(screemW, screemH-40);
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.minimumLineSpacing = 0;
        _containerView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 40, screemW, screemH-titleViewH) collectionViewLayout:layout];
        _containerView.pagingEnabled = YES;
        _containerView.bounces = NO;
        _containerView.delegate = self;
        _containerView.dataSource = self;
        _containerView.showsHorizontalScrollIndicator = NO;
        [_containerView registerClass:[ContentCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
    }
    return _containerView;
}

-(NSMutableArray *)viewControllerArray
{
    if (!_viewControllerArray) {
        _viewControllerArray = [[NSMutableArray alloc] init];
    }
    return _viewControllerArray;
}

@end
