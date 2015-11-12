//
//  VideoNetManger.h
//  BaseProject
//
//  Created by tarena on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "VideoModel.h"
@interface VideoNetManger : BaseNetManager
+(id)getVideoListWithPage:(NSInteger)page completionHandle:(void(^)(id model,NSError *error))completionHandle;
@end
