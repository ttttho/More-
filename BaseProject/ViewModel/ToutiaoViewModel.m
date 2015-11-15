//
//  ToutiaoViewModel.m
//  BaseProject
//
//  Created by tarena on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ToutiaoViewModel.h"
@implementation ToutiaoViewModel
-(NSInteger)rowNumber{
    return self.dataArr.count;
}
-(void)refreshDataCompletionHandle:(CompletionHandle)completionHandle{
    _index=0;
    [self getDataFromNetCompleteHandle:completionHandle];
}
-(void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle{
    _index+=15;
    [self getDataFromNetCompleteHandle:completionHandle];
}
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask=[ToutiaoNetManger getTouTiaoWithIndex:_index completationHandle:^(ToutiaoModel *model, NSError *error) {
        if (_index==0) {
            [self.dataArr removeAllObjects];
        }
        [self.dataArr addObjectsFromArray:model.T1348647853363];
        completionHandle(error);
    }];
}
-(T1348647853363 *)modelForRow:(NSInteger)row{
    return self.dataArr[row];
}
-(NSURL *)iconIVForRow:(NSInteger)row{
    return [NSURL URLWithString:[self modelForRow:row].imgsrc];
}
-(NSString *)titleForRow:(NSInteger)row{
    return [self modelForRow:row].title;
}
-(NSString *)descForRow:(NSInteger)row{
    return [self modelForRow:row].digest;
}
-(NSURL *)toutiaoDetailForRow:(NSInteger)row{
    return [NSURL URLWithString:[self modelForRow:row].url_3w];
}
-(NSURL *)photoSetIdForRow:(NSInteger)row{
    NSString *str=[self modelForRow:row].photosetID;
    NSString *str1=[str substringFromIndex:9];
    NSString *str2=[str substringWithRange:NSMakeRange(4, 4)];
    return[NSURL URLWithString:[NSString stringWithFormat:@"http://3g.163.com/touch/photoview.html?from=index.focusimg&setid=%@&channelid=%@",str1,str2]];
}
-(NSArray *)imgextra:(NSInteger)row{
    NSArray *arr=[self modelForRow:row].imgextra;
    NSMutableArray *array=[NSMutableArray new];
    for (int i=0; i<arr.count; i++) {
        TImgextra *model=arr[i];
        [array addObject:[NSURL URLWithString:model.imgsrc]];
    }
    return [array copy];
}




-(NSArray *)ads{
    if (!_ads) {
        _ads=[self modelForRow:0].ads;
    }
    return _ads;
}
-(TAds *)ModelForRow:(NSInteger)index{
    return self.ads[index];
}
-(NSString *)adsTitleForIndex:(NSInteger)index{
    return [self ModelForRow:index].title;
}
-(NSString *)adsTagForIndex:(NSInteger)index{
    return [self ModelForRow:index].tag;
}
-(NSURL *)adsURLlForIndex:(NSInteger)index{
    NSString *str=[self ModelForRow:index].url;
    NSString *str1=[str substringFromIndex:9];
    NSString *str2=[str substringWithRange:NSMakeRange(4, 4)];
    return[NSURL URLWithString:[NSString stringWithFormat:@"http://3g.163.com/touch/photoview.html?from=index.focusimg&setid=%@&channelid=%@",str1,str2]];
}
-(NSURL *)adsImgForIndex:(NSInteger)index{
    return [NSURL URLWithString:[self ModelForRow:index].imgsrc];
}


@end
