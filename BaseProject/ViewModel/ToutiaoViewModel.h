//
//  ToutiaoViewModel.h
//  BaseProject
//
//  Created by tarena on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "ToutiaoNetManger.h"
@interface ToutiaoViewModel : BaseViewModel
@property(nonatomic,assign)NSInteger rowNumber;
@property(nonatomic,assign)NSInteger index;
-(NSURL *)iconIVForRow:(NSInteger)row;
-(NSString *)titleForRow:(NSInteger)row;
-(NSString *)descForRow:(NSInteger)row;
-(NSURL *)toutiaoDetailForRow:(NSInteger)row;
@end
