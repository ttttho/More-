//
//  VideoCollectionViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "VideoCollectionViewController.h"
#import "VideoViewModel.h"
#import "VideoPlayViewController.h"
@interface VideoCollectionViewController ()<UICollectionViewDelegateFlowLayout>
@property(nonatomic,strong)VideoViewModel *videoVM;
@end

@implementation VideoCollectionViewController
-(VideoViewModel *)videoVM{
    if (!_videoVM) {
        _videoVM=[VideoViewModel new];
    }
    return _videoVM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.videoVM refreshDataCompletionHandle:^(NSError *error) {
            [self.collectionView.header endRefreshing];
            [self.collectionView reloadData];
        }];
    }];
    [self.collectionView.header beginRefreshing];
    self.collectionView.footer=[MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self.videoVM getMoreDataCompletionHandle:^(NSError *error) {
            [self.collectionView.footer beginRefreshing];
            [self.collectionView reloadData];
            [self.collectionView.footer endRefreshing];
        }];
    }];
}

#pragma mark <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.videoVM.rowNumber;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    UIImageView *imageView=(UIImageView *)[cell.contentView viewWithTag:100];
    [imageView setImageWithURL:[self.videoVM iconURLForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"little_animal_30"]];
    UILabel *label=(UILabel *)[cell.contentView viewWithTag:200];
    label.text=[self.videoVM titleForRow:indexPath.row];
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    VideoPlayViewController *vc=[[VideoPlayViewController alloc]initWithPlayURL:[self.videoVM videoURLForRow:indexPath.row] andDescription:[self.videoVM descForRow:indexPath.row]];
    [self.navigationController pushViewController:vc animated:YES];
}


//四周边距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(8,8,8,8);
}
//行边距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 5;
}
//列边距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 5;
}
//每个cell的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat width=(self.view.bounds.size.width-24)/2;
    CGFloat height=width*200/270;//高除以宽
    return CGSizeMake(width, height);
}
@end
