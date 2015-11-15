//
//  ToutiaoNetManger.h
//  BaseProject
//
//  Created by tarena on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "ToutiaoModel.h"
@interface ToutiaoNetManger : BaseNetManager
+getTouTiaoWithIndex:(NSInteger)index completationHandle:(void(^)(id model,NSError *error))completionHandle;

@end
