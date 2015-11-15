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
-(NSURL *)photoSetIdForRow:(NSInteger)row;
//-(BOOL)hasImgextra:(NSInteger)row;


@property(nonatomic,strong)NSArray *ads;
-(NSString *)adsTitleForIndex:(NSInteger)index;
-(NSString *)adsTagForIndex:(NSInteger)index;
-(NSURL *)adsURLlForIndex:(NSInteger)index;
-(NSURL *)adsImgForIndex:(NSInteger)index;



//@property(nonatomic,strong)NSArray *imgextra;
//-(NSURL *)imgextraForRow:(NSInteger)row;
-(NSArray *)imgextra:(NSInteger)row;
@end
