//
//  TitleScv.m
//  仿今日头条首页
//
//  Created by LIANGKUNLIN on 2017/8/28.
//  Copyright © 2017年 meilixun. All rights reserved.
//

#import "TitleScv.h"

#define screemW ([UIScreen mainScreen].bounds.size.width)
#define screemH ([UIScreen mainScreen].bounds.size.height)

@interface TitleScv()
@property (nonatomic, strong) NSMutableArray *btnArray;
@property (nonatomic, strong) UIButton *seletedBtn;
@end

@implementation TitleScv

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor yellowColor];
    }
    return self;
}


-(void)buttonName:(NSString *)buttonName
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:buttonName forState:UIControlStateNormal];
    [btn sizeToFit];
    btn.titleLabel.font = [UIFont systemFontOfSize:15];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.btnArray addObject:btn];
    [self addSubview:btn];
}

-(void)btnClick:(UIButton *)sender
{
    NSInteger index = [self.btnArray indexOfObject:sender];
    if ([self.btnDelegate respondsToSelector:@selector(TitleScvDelegateButtonSelectedIndex:)]) {
        [self.btnDelegate TitleScvDelegateButtonSelectedIndex:index];
    }
}

-(void)setBtnSelectedIndex:(NSInteger)index
{

    UIButton *btn = self.btnArray[index];
    [UIView animateWithDuration:0.25 animations:^{
       
        btn.selected = YES;
        btn.titleLabel.font = [UIFont systemFontOfSize:18.0];
        
        self.seletedBtn.selected = NO;
        self.seletedBtn.titleLabel.font = [UIFont systemFontOfSize:15.0];
        self.seletedBtn = btn;
        
        //计算偏移量
        CGFloat offsetX = btn.center.x - screemW*0.5;
        if (offsetX < 0) {
            offsetX = 0;
        }
        //最大滚动范围
        CGFloat maxOffsetX = self.contentSize.width - screemW;
        if (offsetX > maxOffsetX) {
            offsetX = maxOffsetX;
        }
        
        if (self.contentSize.width > screemW) {
            [self setContentOffset:CGPointMake(offsetX, 0) animated:YES];
        }
        
    }];
}

//按钮布局
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat btnH = 40;
    CGFloat btnX = 15;
    
    
    for (int i = 0; i < self.btnArray.count; i++) {
        UIButton *btn = self.btnArray[i];
        btn.frame = CGRectMake(btnX, 0, btn.frame.size.width, btnH);
        btnX += btn.frame.size.width + 15;
    }
    self.contentSize = CGSizeMake(btnX, 0);
}

-(NSMutableArray *)btnArray
{
    if (!_btnArray) {
        _btnArray = [[NSMutableArray alloc] init];
    }
    return _btnArray;
}
@end
