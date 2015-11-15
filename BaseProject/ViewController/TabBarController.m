//
//  TabBarController.m
//  BaseProject
//
//  Created by tarena on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TabBarController.h"

@interface TabBarController ()

@end

@implementation TabBarController
+(void)initialize{
    if (self==[TabBarController class]) {
        UITabBar *tabBar=[UITabBar appearance];
        //获取UItabbaritem
        UITabBarItem *item=[UITabBarItem appearance];
        //文字位置
        [item setTitlePositionAdjustment:UIOffsetMake(0, -1)];
        //文字普通样式
        NSMutableDictionary *normal=[NSMutableDictionary dictionary];
        normal[NSForegroundColorAttributeName]=[UIColor lightGrayColor];
        normal[NSFontAttributeName]=[UIFont systemFontOfSize:11];
        [item setTitleTextAttributes:normal forState:UIControlStateNormal];
        //文字被选中时样式
        NSMutableDictionary *selected=[NSMutableDictionary dictionary];
        selected[NSForegroundColorAttributeName]=[UIColor redColor];
        selected[NSFontAttributeName]=[UIFont systemFontOfSize:11];
        [item setTitleTextAttributes:selected forState:UIControlStateSelected];
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
