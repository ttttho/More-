//
//  TouTiaoDetailController.h
//  BaseProject
//
//  Created by tarena on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TouTiaoDetailController : UIViewController
-(instancetype)initWithURL:(NSURL *)url;
@property(nonatomic,strong)NSURL *url;
@end
