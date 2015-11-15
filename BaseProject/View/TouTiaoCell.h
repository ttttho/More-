//
//  TouTiaoCell.h
//  BaseProject
//
//  Created by tarena on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyImageView.h"
#import "MyImageView.h"
@interface TouTiaoCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iconIV;
@property (weak, nonatomic) IBOutlet UILabel *titleLb;
@property (weak, nonatomic) IBOutlet UILabel *descLb;
@end
@interface HasImgCell : UITableViewCell
@property(nonatomic,strong)MyImageView *img1;
@property(nonatomic,strong)MyImageView *img2;
@property(nonatomic,strong)MyImageView *img3;
@property(nonatomic,strong)UILabel *subtitle;
@end