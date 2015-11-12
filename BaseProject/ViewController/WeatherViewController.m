//
//  WeatherViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "WeatherViewController.h"

@interface WeatherViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@end

@implementation WeatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"a" ofType:@"gif"];
    NSData *gif = [NSData dataWithContentsOfFile:filePath];
    [self.webView loadData:gif MIMEType:@"image/gif" textEncodingName:nil baseURL:nil];
    self.webView.userInteractionEnabled = NO;
    [self.view addSubview:self.webView];
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
