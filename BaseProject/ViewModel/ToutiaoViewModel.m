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
@end
