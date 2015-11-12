//
//  TouTiaoCell.m
//  BaseProject
//
//  Created by tarena on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TouTiaoCell.h"

@implementation TouTiaoCell
-(MyImageView *)iconIV{
    if (!_iconIV) {
        _iconIV=[[MyImageView alloc]init];
        [self.contentView addSubview:_iconIV];
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.top.mas_equalTo(8);
            make.size.mas_equalTo(CGSizeMake((kWindowW/2-4),(kWindowW/2-4)));
        }];
    }
    return _iconIV;
}
-(UILabel *)title{
    if (!_title) {
        _title=[[UILabel alloc]init];
        _title.font=[UIFont boldFlatFontOfSize:16];
        _title.textColor=[UIColor blackColor];
        _title.textAlignment=NSTextAlignmentCenter;
        _title.numberOfLines=3;
        [self.contentView addSubview:_title];
        [_title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.top.mas_equalTo(self.iconIV.mas_bottom).mas_equalTo(10);
            make.width.mas_equalTo(kWindowW/2-50);
        }];
    }
    return _title;
}
-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        self.backgroundColor=[UIColor whiteColor];
        [self.contentView addSubview:self.iconIV];
        [self.contentView addSubview:self.title];
    }
    return self;
}
@end
