//
//  XLLinkageView.m
//  XLLinkageViewDemo
//
//  Created by 路 on 2018/1/10.
//  Copyright © 2018年 路. All rights reserved.
//

#import "XLLinkageView.h"
#import "XLLinkageTableViewCell.h"

static NSString *LinkageTableViewCell = @"LinkageTableViewCell";

@interface XLLinkageView()<UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;
@property (nonatomic, strong) UIViewController *parentVC;
@property (nonatomic, strong) NSArray<UIViewController *> *childVCs;
@end

@implementation XLLinkageView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addTableView];
        [self addContentView];
    }
    return self;
}

-(void)awakeFromNib{
    [super awakeFromNib];
    [self addTableView];
    [self addContentView];
}




-(void)setChildVCs:(NSArray<UIViewController *> *)childVCs parentVC:(UIViewController *)parentVC defaultItem:(NSInteger)defaultItem{
    _parentVC = parentVC;
    _childVCs = childVCs;
    [self layoutSubviews];
    for (UIViewController *vc in _childVCs) {
        [_parentVC addChildViewController:vc];
    }
    [self.tableView reloadData];
    [self.collectionView reloadData];
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:defaultItem inSection:0];
    [self.collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
    [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionMiddle animated:NO];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    _tableView.frame = CGRectMake(0, 0, 100, self.frame.size.height);
    _flowLayout.itemSize = CGSizeMake(self.frame.size.width - 100, self.frame.size.height);
    _collectionView.frame = CGRectMake(self.tableView.frame.size.width, 0, self.frame.size.width - self.tableView.frame.size.width, self.frame.size.height);
}

-(void)addTableView{
    _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    [_tableView registerClass:[XLLinkageTableViewCell class] forCellReuseIdentifier:LinkageTableViewCell];
    [self.tableView setSeparatorInset:UIEdgeInsetsMake(0, 0, 0, 0)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self addSubview:_tableView];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _childVCs.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01f;
}


-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01f;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    XLLinkageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:LinkageTableViewCell];
    if (!cell) {
        cell = [[XLLinkageTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:LinkageTableViewCell];
        cell.detailTextLabel.text = @"测试";
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
}





///添加UICollectionView
-(void)addContentView{
    _flowLayout = [[UICollectionViewFlowLayout alloc] init];
    _flowLayout.minimumLineSpacing = 0;
    _flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:_flowLayout];
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.pagingEnabled = YES;
    _collectionView.scrollEnabled = NO;
    _collectionView.showsVerticalScrollIndicator = NO;
    _collectionView.showsHorizontalScrollIndicator = NO;
    [self addSubview:_collectionView];
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
}



#pragma mark --- UICollectionViewDataSource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return  _childVCs.count;
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    for (UIView *subView in cell.contentView.subviews) {
        [subView removeFromSuperview];
    }
    UIViewController *vc = _childVCs[indexPath.item];
    vc.view.frame = cell.contentView.frame;
    [cell.contentView addSubview:vc.view];
    return cell;
}


@end
