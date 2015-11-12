//
//  TouTiaoViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TouTiaoViewController.h"
#import "TouTiaoCell.h"
#import "ToutiaoViewModel.h"
#import "TouTiaoDetailController.h"
@interface MyLayout : UICollectionViewFlowLayout
@end
@implementation MyLayout
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.itemSize = CGSizeMake((kWindowW/2-2), (kWindowW/2-2));
        self.minimumLineSpacing = 1;
        self.minimumInteritemSpacing = 1;
        self.sectionInset = UIEdgeInsetsMake(1, 1, 1, 1);
//        //设置视图的滚动方式为水平滚动
//        self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    }
    return self;
}
@end



@interface TouTiaoViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong)ToutiaoViewModel *toutiaoVM;
@property(nonatomic,strong)UICollectionView *collection;
@property(nonatomic,strong)NSURL *toutiaoURL;
@end

@implementation TouTiaoViewController

-(ToutiaoViewModel *)toutiaoVM{
    if (!_toutiaoVM) {
        _toutiaoVM=[[ToutiaoViewModel alloc]init];
    }
    return _toutiaoVM;
}
-(UICollectionView *)collection{
    if (!_collection) {
        MyLayout *layout=[[MyLayout alloc]init];
        _collection=[[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _collection.delegate=self;
        _collection.dataSource=self;
        _collection.backgroundColor=[UIColor lightGrayColor];
        [self.view addSubview:_collection];
        [_collection mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        [_collection registerClass:[TouTiaoCell class] forCellWithReuseIdentifier:@"Cell"];
    }
    return _collection;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collection.header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.toutiaoVM refreshDataCompletionHandle:^(NSError *error) {
            [self.collection.header endRefreshing];
            [self.collection reloadData];
        }];
    }];
    self.collection.footer=[MJRefreshBackFooter footerWithRefreshingBlock:^{
        [self.toutiaoVM getMoreDataCompletionHandle:^(NSError *error) {
            [self.collection.footer beginRefreshing];
            [self.collection reloadData];
            [self.collection.footer endRefreshing];
        }];
    }];
    [self.collection.header beginRefreshing];
   }


#pragma mark - Table view data source
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.toutiaoVM.rowNumber;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    TouTiaoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    [cell.iconIV.imageView setImageWithURL:[self.toutiaoVM iconIVForRow:indexPath.row]];
    cell.title.text=[self.toutiaoVM titleForRow:indexPath.row];
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    TouTiaoDetailController *vc=[[TouTiaoDetailController alloc]initWithURL:[self.toutiaoVM toutiaoDetailForRow:indexPath.row]];
    [self.navigationController pushViewController:vc animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 110;
}


@end
