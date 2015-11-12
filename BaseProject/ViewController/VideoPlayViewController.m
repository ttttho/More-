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
@property(nonatomic,strong) AVPlayerLayer *layer;
@property(nonatomic,strong)AVPlayer *player;
@end

@implementation VideoPlayViewController
-(id)initWithPlayURL:(NSURL *)url andDescription:(NSString *)desc{
    if (self=[super init]) {
        self.url=url;
        self.desc=desc;
    }
    return self;
}
-(UIButton *)playButton{
    if (!_playButton) {
        _playButton=[UIButton buttonWithType:0];
        [_playButton setBackgroundImage:[UIImage imageNamed:@"play"] forState:0];
//        [_playButton addTarget:self action:@selector(touchButton:) forControlEvents:0];
        [self.view addSubview:_playButton];
        [_playButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(kWindowW-20);
            make.height.mas_equalTo((kWindowW-20)*190/285);
            make.centerX.mas_equalTo(0);
            make.top.mas_equalTo(70);
        }];
    }
    return _playButton;
}
-(UILabel *)descLabel{
    if (!_descLabel) {
        _descLabel=[[UILabel alloc]init];
        _descLabel.text=self.desc;
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
    self.view.backgroundColor=[UIColor greenSeaColor];
    [self.view addSubview:self.playButton];
    [self.view addSubview:self.descLabel];
    self.title=@"视频播放";
    self.player=[AVPlayer playerWithURL:self.url];
    self.layer=[AVPlayerLayer playerLayerWithPlayer:self.player];
    [self.playButton bk_addEventHandler:^(id sender) {
        [self.layer removeFromSuperlayer];
        self.layer.frame=self.playButton.frame;
        [self.view.layer addSublayer:self.layer];
        [self.player play];
    } forControlEvents:UIControlEventTouchUpInside];
    
}
-(void)viewWillDisappear:(BOOL)animated{
    [self.player pause];
    [self.view removeFromSuperview];
    self.player=nil;
}
@end

