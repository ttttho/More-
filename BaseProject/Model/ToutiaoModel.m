//
//  ToutiaoModel.m
//  BaseProject
//
//  Created by tarena on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ToutiaoModel.h"

@implementation ToutiaoModel


+ (NSDictionary *)objectClassInArray{
    return @{@"T1348647853363" : [T1348647853363 class]};
}
@end
@implementation T1348647853363

+ (NSDictionary *)objectClassInArray{
    return @{@"ads" : [TAds class], @"imgextra" : [TImgextra class]};
}
+(NSDictionary *)replacedKeyFromPropertyName{
    return @{@"Template":@"template"};
}
@end


@implementation TAds

@end


@implementation TImgextra

@end


