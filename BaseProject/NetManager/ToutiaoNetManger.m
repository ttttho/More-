//
//  ToutiaoNetManger.m
//  BaseProject
//
//  Created by tarena on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ToutiaoNetManger.h"

@implementation ToutiaoNetManger
+getTouTiaoWithIndex:(NSInteger)index completationHandle:(void(^)(id model,NSError *error))completionHandle{
    NSString *path=[NSString stringWithFormat:@"http://c.3g.163.com/nc/article/headline/T1348647853363/%ld-14.html",index];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([ToutiaoModel objectWithKeyValues:responseObj],error);
    }];
}
@end
