//
//  ContentView.h
//  仿今日头条首页
//
//  Created by LIANGKUNLIN on 2017/8/28.
//  Copyright © 2017年 meilixun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContentView : UIView

/** 外界传一个控制器过来 */
-(void)createViewController:(UIViewController *)controller;
/** 当前选中的item */
-(void)selectedItem;
@end
