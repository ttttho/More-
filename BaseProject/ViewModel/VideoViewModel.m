//
//  VideoViewModel.m
//  BaseProject
//
//  Created by tarena on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "VideoViewModel.h"

@implementation VideoViewModel
-(NSInteger)rowNumber{
    return self.dataArr.count;
}
-(VideoVideolist *)videoListModelForRow:(NSInteger)row{
    return self.dataArr[row];
}
-(NSString *)titleForRow:(NSInteger)row{
    return [self videoListModelForRow:row].title;
}
-(NSString *)descForRow:(NSInteger)row{
    return [self videoListModelForRow:row].Description;
}
-(NSURL *)iconURLForRow:(NSInteger)row{
    return [NSURL URLWithString:[self videoListModelForRow:row].cover];
}
-(NSURL *)videoURLForRow:(NSInteger)row{
    return [NSURL URLWithString:[self videoListModelForRow:row].mp4_url];
}
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask = [VideoNetManger getVideoListWithPage:_page completionHandle:^(VideoModel *model, NSError *error) {
        if (_page==0) {
            [self.dataArr removeAllObjects];
        }
        [self.dataArr addObjectsFromArray:model.videoList];
        completionHandle(error);
    }];
}
-(void)refreshDataCompletionHandle:(CompletionHandle)completionHandle{
    _page=0;
    [self getDataFromNetCompleteHandle:completionHandle];
}
-(void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle{
    _page+=15;
    [self getDataFromNetCompleteHandle:completionHandle];
}
@end
