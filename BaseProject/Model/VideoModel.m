//
//  VideoModel.m
//  BaseProject
//
//  Created by tarena on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "VideoModel.h"

@implementation VideoModel


+ (NSDictionary *)objectClassInArray{
    return @{@"videoSidList" : [VideoVideosidlist class], @"videoList" : [VideoVideolist class]};
}
@end
@implementation VideoVideosidlist

@end


@implementation VideoVideolist
+(NSDictionary *)replacedKeyFromPropertyName{
    return @{@"Description":@"description"};
}
@end


