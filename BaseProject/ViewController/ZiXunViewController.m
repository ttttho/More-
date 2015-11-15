//
//  ZiXunViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/13.
//  Copyright © 2015年 Tarena. All rights reserved.
//

/*#import "ZiXunViewController.h"

@interface ZiXunViewController ()

@end

@implementation ZiXunViewController
+ (UINavigationController *)standardTuWanNavi{
    static UINavigationController *navi = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ZiXunViewController *vc = [[ZiXunViewController alloc] initWithViewControllerClasses:[self viewControllerClasses] andTheirTitles:[self itemNames]];
        //例如设置第一个控制器的某个属性的值, KVC
        //vc setValue:[values[0]] forKey:keys[0]
        vc.keys = [self vcKeys];
        vc.values = [self vcValues];
        navi = [[UINavigationController alloc] initWithRootViewController:vc];
    });
    return navi;
}
/** 提供每个VC对应的values值数组 */
/*+ (NSArray *)vcValues{
    NSMutableArray *arr = [NSMutableArray new];
    for (int i = 0; i <[self itemNames].count; i++) {
        //数值上，vc的infoType的枚举值 恰好和i值相同
        [arr addObject:@(i)];
    }
    return arr;
}
/** 提供每个VC对应的key值数组 */
/*+ (NSArray *)vcKeys{
    NSMutableArray *arr = [NSMutableArray new];
    for (id obj in [self itemNames]) {
        [arr addObject:@"infoType"];
    }
    return [arr copy];
}

/** 提供题目数组 */
/*+ (NSArray *)itemNames{
    return @[@"头条",@"独家",@"暗黑3",@"魔兽",@"风暴",@"炉石",@"星际2",@"守望",@"图片",@"视频",@"攻略",@"幻化",@"趣闻",@"COS",@"美女"];
}
/** 提供每个题目对应的控制器的类型。题目和类型数量必须一致 */
/*+ (NSArray *)viewControllerClasses{
    NSMutableArray *arr = [NSMutableArray new];
    for (id obj in [self itemNames]) {
        [arr addObject:[TuWanListViewController class]];
    }
    return [arr copy];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor greenSeaColor];
    self.title = @"兔玩";
    [Factory addMenuItemToVC:self];
}


@end
*/
