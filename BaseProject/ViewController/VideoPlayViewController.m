//
//  VideoPlayViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "VideoPlayViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>
@interface VideoPlayViewController ()
@property(nonatomic,strong)UIButton *playButton;
@property(nonatomic,strong)UILabel *descLabel;
@end

@implementation VideoPlayViewController
-(UIButton *)playButton{
    if (!_playButton) {
        _playButton=[UIButton buttonWithType:0];
        [_playButton setBackgroundImage:[UIImage imageNamed:@"play"] forState:0];
        [_playButton addTarget:self action:@selector(touchButton:) forControlEvents:0];
        [self.view addSubview:_playButton];
        [_playButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(kWindowW-20);
            make.height.mas_equalTo((kWindowW-20)*175/297);
            make.centerX.mas_equalTo(0);
            make.top.mas_equalTo(20);
        }];
    }
    return _playButton;
}
-(UILabel *)descLabel{
    if (!_descLabel) {
        _descLabel=[[UILabel alloc]init];
        [self.view addSubview:_descLabel];
        _descLabel.font=[UIFont boldFlatFontOfSize:20];
        _descLabel.textColor=[UIColor grayColor];
        _descLabel.textAlignment=NSTextAlignmentCenter;
        _descLabel.numberOfLines=0;
        [_descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(20);
            make.right.mas_equalTo(20);
            make.top.mas_equalTo(self.playButton.mas_bottom).mas_equalTo(20);
        }];
    }
    return _descLabel;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
}
-(void)touchButton:(id)sender{
    AVPlayer *player=[AVPlayer playerWithURL:self.url];
    [player play];
    [self.view shareInstance].player=player;
//    [sender addSubview:[VideoCell shareInstance].view];
//    [[VideoCell shareInstance].view mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.mas_equalTo(0);
//    }];

}
+(AVPlayerViewController *)shareInstance{
    static AVPlayerViewController *vc=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        vc=[AVPlayerViewController new];
    });
    return vc;
}
-(void)prepareForReuse{
    [super prepareForReuse];
    //判段当前cell是否有播放，如果有删除
    [[VideoCell shareInstance].view removeFromSuperview];
    [VideoCell shareInstance].player=nil;
}
@end
