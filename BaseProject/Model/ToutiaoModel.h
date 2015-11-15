//
//  ToutiaoModel.h
//  BaseProject
//
//  Created by tarena on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class T1348647853363,TAds,TImgextra;

@interface ToutiaoModel : BaseModel
@property (nonatomic, strong) NSArray<T1348647853363 *> *T1348647853363;
@end

@interface T1348647853363 : NSObject

@property (nonatomic, copy) NSString *tname;

@property (nonatomic, copy) NSString *ptime;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) NSArray<TImgextra *> *imgextra;

@property (nonatomic, copy) NSString *photosetID;

@property (nonatomic, assign) NSInteger hasHead;

@property (nonatomic, assign) NSInteger hasImg;

@property (nonatomic, copy) NSString *lmodify;

@property (nonatomic, copy) NSString *Template;

@property (nonatomic, copy) NSString *skipType;

@property (nonatomic, assign) NSInteger replyCount;

@property (nonatomic, copy) NSString *alias;

@property (nonatomic, copy) NSString *docid;

@property (nonatomic, assign) BOOL hasCover;

@property (nonatomic, assign) NSInteger hasAD;

@property (nonatomic, assign) NSInteger priority;

@property (nonatomic, copy) NSString *cid;

@property (nonatomic, copy) NSString *imgsrc;

@property (nonatomic, assign) BOOL hasIcon;

@property (nonatomic, strong) NSArray *ads;

@property (nonatomic, copy) NSString *ename;

@property (nonatomic, copy) NSString *skipID;

@property (nonatomic, assign) NSInteger order;

@property (nonatomic, copy) NSString *digest;

@property(nonatomic,strong)NSString *url;
@property(nonatomic,strong)NSString *url_3w;
@end

@interface TAds : NSObject
@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *subtitle;

@property (nonatomic, copy) NSString *tag;

@property (nonatomic, copy) NSString *imgsrc;
@end

@interface TImgextra : NSObject
@property (nonatomic, copy) NSString *imgsrc;
@end

