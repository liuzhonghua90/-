//
//  ViewController.m
//  仿今日头条首页
//
//  Created by LIANGKUNLIN on 2017/8/28.
//  Copyright © 2017年 meilixun. All rights reserved.
//

#import "ViewController.h"
#import "NomalViewController.h"
#import "UIView+Common.h"
#import "ContentView.h"


#define screemW ([UIScreen mainScreen].bounds.size.width)
#define screemH ([UIScreen mainScreen].bounds.size.height)
#define tagBtnW (50)
@interface ViewController ()
@property (nonatomic, strong) NSMutableArray *titleArr;
@property (nonatomic, strong) UIScrollView *titleScv;
@property (nonatomic, strong) NomalViewController *nomalCrt;
@property (nonatomic, strong) UIScrollView *contentScv;



@property (nonatomic, strong) ContentView *contentView;
@property (nonatomic, assign) NSInteger index;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.contentView];

    
}

-(ContentView *)contentView
{
    if (!_contentView) {
        _contentView = [[ContentView alloc] initWithFrame:CGRectMake(0, 20, screemW, screemH-20)];
        
        NomalViewController *nomalCtl0 = [[NomalViewController alloc] init];
        nomalCtl0.title = @"关注";
        [_contentView createViewController:nomalCtl0];
        
        NomalViewController *nomalCtl1 = [[NomalViewController alloc] init];
        nomalCtl1.title = @"推荐";
        [_contentView createViewController:nomalCtl1];
        
        NomalViewController *nomalCtl2 = [[NomalViewController alloc] init];
        nomalCtl2.title = @"热点";
        [_contentView createViewController:nomalCtl2];
        
        NomalViewController *nomalCtl3 = [[NomalViewController alloc] init];
        nomalCtl3.title = @"视频";
        [_contentView createViewController:nomalCtl3];
        
        NomalViewController *nomalCtl4 = [[NomalViewController alloc] init];
        nomalCtl4.title = @"深圳";
        [_contentView createViewController:nomalCtl4];
        
        NomalViewController *nomalCtl5= [[NomalViewController alloc] init];
        nomalCtl5.title = @"娱乐";
        [_contentView createViewController:nomalCtl5];
        
        NomalViewController *nomalCtl6 = [[NomalViewController alloc] init];
        nomalCtl6.title = @"回答";
        [_contentView createViewController:nomalCtl6];
        
        NomalViewController *nomalCtl7 = [[NomalViewController alloc] init];
        nomalCtl7.title = @"科技";
        [_contentView createViewController:nomalCtl7];
        
        NomalViewController *nomalCtl8 = [[NomalViewController alloc] init];
        nomalCtl8.title = @"图片";
        [_contentView createViewController:nomalCtl8];
        
        
    }
    return _contentView;
}


-(void)createTitleView
{
    CGFloat tagBtnH = 30;
    for (int i = 0; i < self.titleArr.count; i++) {
        UIButton *tagBtn = [[UIButton alloc] init];
        tagBtn.frame = CGRectMake(tagBtnW*i, 0, tagBtnW, tagBtnH);
        [tagBtn setTitle:self.titleArr[i] forState:UIControlStateNormal];
        [tagBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [tagBtn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        tagBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        tagBtn.tag = i;
        [tagBtn addTarget:self action:@selector(tagBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.titleScv addSubview:tagBtn];
        if (i == 0) {
            tagBtn.selected = YES;
        }
    }
}

-(void)tagBtnClick:(UIButton *)sender
{
    
    if (sender.selected == NO) {
        self.nomalCrt = [[NomalViewController alloc] init];
        [self.contentScv addSubview:self.nomalCrt.view];
    }
    
    if (sender.tag > 2 && sender.tag < 6) {
        [self.titleScv setContentOffset:CGPointMake(tagBtnW*(sender.tag-2), 0) animated:YES];
    }
}

-(UIScrollView *)contentScv
{
    if (!_contentScv) {
        _contentScv = [[UIScrollView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.titleScv.frame), screemW, screemH-CGRectGetMaxY(self.titleScv.frame))];
        _contentScv.backgroundColor = [UIColor yellowColor];
        _contentScv.showsHorizontalScrollIndicator = NO;
        _contentScv.alwaysBounceHorizontal = YES;
    }
    return _contentScv;
}

-(UIScrollView *)titleScv
{
    if (!_titleScv) {
        _titleScv = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 20, screemW, 30)];
        _titleScv.showsHorizontalScrollIndicator = NO;
        _titleScv.alwaysBounceHorizontal = YES;
    }
    return _titleScv;
}


@end
