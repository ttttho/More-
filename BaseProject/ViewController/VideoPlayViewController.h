//
//  VideoPlayViewController.h
//  BaseProject
//
//  Created by tarena on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VideoPlayViewController : UIViewController
-(id)initWithPlayURL:(NSURL *)url andDescription:(NSString *)desc;
@property(nonatomic,strong)NSURL *url;
@property(nonatomic,strong)NSString *desc;
@end
