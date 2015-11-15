//
//  TouTiaoCell.m
//  BaseProject
//
//  Created by tarena on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TouTiaoCell.h"

@implementation TouTiaoCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //设置cell被选中后的背景色
        UIView *view=[UIView new];
        view.backgroundColor=kRGBColor(243, 255, 254);
        self.selectedBackgroundView=view;
    }
    return self;
}
@end
@implementation HasImgCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //设置cell被选中后的背景色
        UIView *view=[UIView new];
        view.backgroundColor=kRGBColor(243, 255, 254);
        self.selectedBackgroundView=view;
    }
    return self;
}
-(MyImageView *)img1{
    if (!_img1) {
        _img1=[MyImageView new];
        [self.contentView addSubview:_img1];
        [_img1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(10);
            make.left.mas_equalTo(10);
            make.size.mas_equalTo(CGSizeMake((kWindowW-40)/3,(kWindowW-40)/3));
        }];
    }
    return _img1;
}
-(MyImageView *)img2{
    if (!_img2) {
        _img2=[MyImageView new];
        [self.contentView addSubview:_img2];
        [_img2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(10);
            make.left.mas_equalTo(self.img1.mas_right).mas_equalTo(10);
            make.size.mas_equalTo(CGSizeMake((kWindowW-40)/3,(kWindowW-40)/3));
        }];
    }
    return _img2;
}
-(MyImageView *)img3{
    if (!_img3) {
        _img3=[MyImageView new];
        [self.contentView addSubview:_img3];
        [_img3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(10);
            make.left.mas_equalTo(self.img2.mas_right).mas_equalTo(10);
            make.size.mas_equalTo(CGSizeMake((kWindowW-40)/3,(kWindowW-40)/3));
        }];
    }
    return _img3;
}
-(UILabel *)subtitle{
    if (!_subtitle) {
        _subtitle=[UILabel new];
        _subtitle.font=[UIFont systemFontOfSize:17];
        _subtitle.textColor=[UIColor blackColor];
        [self.contentView addSubview:_subtitle];
        [_subtitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.right.bottom.mas_equalTo(-10);
            make.top.mas_equalTo(self.img3.mas_bottom).mas_equalTo(10);
        }];
    }
    return _subtitle;
}
@end