//
//  TouTiaoDetailController.m
//  BaseProject
//
//  Created by tarena on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TouTiaoDetailController.h"

@interface TouTiaoDetailController ()<UIWebViewDelegate>
@property(nonatomic,strong)UIWebView *webView;
@end

@implementation TouTiaoDetailController
-(UIWebView *)webView{
    if (!_webView) {
        _webView=[[UIWebView alloc]init];
        _webView.delegate=self;
        [self.view addSubview:_webView];
        [_webView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.left.bottom.mas_equalTo(0);
            make.top.mas_equalTo(-46);
        }];
    }
    return _webView;
}
-(instancetype)initWithURL:(NSURL *)url{
    if (self=[super init]) {
        self.url=url;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    NSURLRequest *request=[NSURLRequest requestWithURL:self.url];
    [self.webView loadRequest:request];
    self.navigationController.toolbarHidden=YES;
}
#pragma mark-delegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    return YES;
}
- (void)webViewDidStartLoad:(UIWebView *)webView{
    [self showProgress];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [self hideProgress];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error{
    [self hideProgress];
}

@end
