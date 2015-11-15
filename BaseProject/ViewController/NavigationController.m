//
//  TRNavigationController.m
//  MyWechat
//
//  Created by tarena on 15/9/18.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "NavigationController.h"

@interface NavigationController ()

@end

@implementation NavigationController

//第一次使用这个类或者子类时自动执行
+ (void)initialize{
    if (self==[NavigationController class]) {
        //获取导航条的外观
        UINavigationBar *bar=[UINavigationBar appearance];
        //设置背景色
        [bar setBarTintColor:[UIColor blackColor]];
//        //背景图
//        [bar setBackgroundImage:[UIImage imageNamed:@"navibg"] forBarMetrics:UIBarMetricsDefault];//横屏或竖屏
        //左右按钮的文字颜色
        [bar setTintColor:[UIColor whiteColor]];
        //标题文字的垂直位置
        [bar setTitleVerticalPositionAdjustment:0 forBarMetrics:UIBarMetricsDefault];
        //设置导航栏样式-影响状态栏中文字颜色
        [bar setBarStyle:UIBarStyleBlack];
        //标题栏文字样式
        NSMutableDictionary *attributes=[NSMutableDictionary dictionary];
        attributes[NSFontAttributeName]=[UIFont boldSystemFontOfSize:18];
        attributes[NSForegroundColorAttributeName]=[UIColor whiteColor];
        [bar setTitleTextAttributes:attributes];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *select=[self.tabBarItem.selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.tabBarItem.selectedImage=select;
   }
@end
