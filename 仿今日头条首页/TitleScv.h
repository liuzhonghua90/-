//
//  TitleScv.h
//  仿今日头条首页
//
//  Created by LIANGKUNLIN on 2017/8/28.
//  Copyright © 2017年 meilixun. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TitleScvDelegate <NSObject>

-(void)TitleScvDelegateButtonSelectedIndex:(NSInteger)selectedIndex;

@end

@interface TitleScv : UIScrollView


/*** 代理*/
@property (nonatomic, weak)  id<TitleScvDelegate> btnDelegate;

/** 传按钮名字 创建按钮 */
-(void)buttonName:(NSString *)buttonName;
/** 滚动标题scv 让按钮同步滚动 */
-(void)setBtnSelectedIndex:(NSInteger)index;

@end
