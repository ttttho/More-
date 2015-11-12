//
//  VideoNetManger.m
//  BaseProject
//
//  Created by tarena on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "VideoNetManger.h"

@implementation VideoNetManger
+(id)getVideoListWithPage:(NSInteger)page completionHandle:(void (^)(id, NSError *))completionHandle{
    NSString *path=[NSString stringWithFormat:@"http://c.3g.163.com/nc/video/home/%ld-10.html",page];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([VideoModel objectWithKeyValues:responseObj],error);
    }];
}
@end
