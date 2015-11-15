
//
//  TouTiaoTableViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/13.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TouTiaoTableViewController.h"
#import "TouTiaoCell.h"
#import "ToutiaoViewModel.h"
#import "TouTiaoDetailController.h"
#import "iCarousel.h"
@interface TouTiaoTableViewController ()<iCarouselDelegate,iCarouselDataSource>
@property(nonatomic,strong)ToutiaoViewModel *toutiaoVM;
@property (strong, nonatomic) IBOutlet UITableView *tableview;
@end

@implementation TouTiaoTableViewController
{//添加成员变量,因为不需要懒加载,所以不需要是属性
    iCarousel *_ic;
    UIPageControl *_pageControl;
    UILabel *_titleLb;
    NSTimer *_timer;
}
-(UIView *)headerView{
    [_timer invalidate];
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, kWindowW/750 * 500)];
    //添加底部视图
    UIView *botoomView = [UIView new];
    botoomView.backgroundColor = kRGBColor(240, 240, 240);
    [headView addSubview:botoomView];
    [botoomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(0);
        make.height.mas_equalTo(35);
    }];
    _titleLb = [UILabel new];
    [botoomView addSubview:_titleLb];
    [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.mas_equalTo(0);
    }];
    _pageControl = [UIPageControl new];
    _pageControl.numberOfPages = 5;
    [botoomView addSubview:_pageControl];
    [_pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.centerY.mas_equalTo(0);
        make.width.mas_lessThanOrEqualTo(60);
        make.width.mas_greaterThanOrEqualTo(20);
        make.left.mas_equalTo(_titleLb.mas_right).mas_equalTo(-10);
    }];
    _titleLb.text = [self.toutiaoVM adsTitleForIndex:0];
    //添加滚动栏
    _ic = [iCarousel new];
    [headView addSubview:_ic];
    [_ic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(0);
        make.bottom.mas_equalTo(botoomView.mas_top).mas_equalTo(0);
    }];
    _ic.delegate = self;
    _ic.dataSource = self;
    _ic.pagingEnabled = YES;
    _ic.scrollSpeed = 1;

    _pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    _pageControl.currentPageIndicatorTintColor = [UIColor redColor];
        _timer = [NSTimer bk_scheduledTimerWithTimeInterval:3 block:^(NSTimer *timer) {
            [_ic scrollToItemAtIndex:_ic.currentItemIndex+1 animated:YES];
        } repeats:YES];
    
    //小圆点 不能与用户交互
    _pageControl.userInteractionEnabled = NO;
    return headView;
}
//允许循环滚
-(CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
{
    if (option == iCarouselOptionWrap) {
        return YES;
    }
    return value;
}

- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    return self.toutiaoVM.ads.count;
}
- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(nullable UIView *)view{
    if (!view) {
        view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWindowW, kWindowW/750 * 500 - 35)];
        UIImageView *imageView = [UIImageView new];
        [view addSubview:imageView];
        imageView.tag = 100;
        imageView.contentMode = 2;
        view.clipsToBounds = YES;
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    UIImageView *imageView = (UIImageView *)[view viewWithTag:100];
    [imageView setImageWithURL:[self.toutiaoVM adsImgForIndex:index] placeholderImage:[UIImage imageNamed:@"little_animal_30"]];
    return view;
}
-(void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel{
    _titleLb.text = [self.toutiaoVM adsTitleForIndex:carousel.currentItemIndex];
    _pageControl.currentPage = carousel.currentItemIndex;
}
- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index{
       TouTiaoDetailController *vc=[[TouTiaoDetailController alloc]initWithURL:[self.toutiaoVM adsURLlForIndex:index]];
        [self.navigationController pushViewController:vc animated:YES];
}




-(ToutiaoViewModel *)toutiaoVM{
    if (!_toutiaoVM) {
        _toutiaoVM=[ToutiaoViewModel new];
    }
    return _toutiaoVM;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[HasImgCell class] forCellReuseIdentifier:@"HasImgCell"];
    self.title=@"新闻头条";
    self.tableview.header=[MJRefreshNormalHeader  headerWithRefreshingBlock:^{
        [self.toutiaoVM refreshDataCompletionHandle:^(NSError *error) {
            [self.tableview.header endRefreshing];
            self.tableView.tableHeaderView = [self headerView];
            [self.tableview reloadData];
        }];
    }];
    
    self.tableview.footer=[MJRefreshBackNormalFooter  footerWithRefreshingBlock:^{
        [self.toutiaoVM getMoreDataCompletionHandle:^(NSError *error) {
            [self.tableview.footer beginRefreshing];
            [self.tableview reloadData];
            [self.tableview.footer endRefreshing];
        }];
    }];
    [self.tableview.header beginRefreshing];
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.toutiaoVM.rowNumber;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.toutiaoVM imgextra:indexPath.row].count!=0) {
        HasImgCell *cell=[tableView dequeueReusableCellWithIdentifier:@"HasImgCell"];
        [cell.img1.imageView setImageWithURL:[self.toutiaoVM iconIVForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"error"]];
        [cell.img2.imageView setImageWithURL:[self.toutiaoVM imgextra:indexPath.row][0] placeholderImage:[UIImage imageNamed:@"error"]];
        [cell.img3.imageView setImageWithURL:[self.toutiaoVM imgextra:indexPath.row][1] placeholderImage:[UIImage imageNamed:@"error"]];
        cell.subtitle.text=[self.toutiaoVM titleForRow:indexPath.row];
        return cell;
    }
    TouTiaoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TouTiaoCell" forIndexPath:indexPath];
    [cell.iconIV setImageWithURL:[self.toutiaoVM iconIVForRow:indexPath.row]];
    cell.titleLb.text=[self.toutiaoVM titleForRow:indexPath.row];
    cell.descLb.text=[self.toutiaoVM descForRow:indexPath.row];
        return cell;
}
kRemoveCellSeparator
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if ([self.toutiaoVM imgextra:indexPath.row].count!=0) {
        TouTiaoDetailController *vc=[[TouTiaoDetailController alloc]initWithURL:[self.toutiaoVM photoSetIdForRow:indexPath.row]];
        [self.navigationController pushViewController:vc animated:YES];
    }else{
    TouTiaoDetailController *vc=[[TouTiaoDetailController alloc]initWithURL:[self.toutiaoVM toutiaoDetailForRow:indexPath.row]];
        [self.navigationController pushViewController:vc animated:YES];}

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.toutiaoVM imgextra:indexPath.row].count!=0) {
        return kWindowH*130/555;
    }return kWindowH*75/555;
}

@end
