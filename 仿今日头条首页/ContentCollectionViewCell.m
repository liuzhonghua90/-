//
//  ContentCollectionViewCell.m
//  仿今日头条首页
//
//  Created by LIANGKUNLIN on 2017/8/28.
//  Copyright © 2017年 meilixun. All rights reserved.
//

#import "ContentCollectionViewCell.h"

@implementation ContentCollectionViewCell

-(void)setCtr:(UIViewController *)ctr
{
    _ctr = ctr;
    [self.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self.contentView addSubview:ctr.view];
    ctr.view.frame = self.bounds;//这里一定是bounds，不能写frame
}
@end
