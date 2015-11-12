//
//  VideoViewModel.h
//  BaseProject
//
//  Created by tarena on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "VideoNetManger.h"
@interface VideoViewModel : BaseViewModel
@property(nonatomic,assign)NSInteger rowNumber;
@property(nonatomic,assign)NSInteger page;
-(NSString *)titleForRow:(NSInteger)row;
-(NSString *)descForRow:(NSInteger)row;
-(NSURL *)iconURLForRow:(NSInteger)row;
-(NSURL *)videoURLForRow:(NSInteger)row;
@end
