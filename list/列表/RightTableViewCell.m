//
//  RightTableViewCell.m
//  CoolTest
//
//  Created by DTMobile on 2017/5/17.
//  Copyright © 2017年 DEV. All rights reserved.
//

#import "RightTableViewCell.h"
#import "RightCollectionCell.h"

static NSString *rightCollectionId = @"rightCollectionCell";

@interface RightTableViewCell ()<UICollectionViewDataSource,UICollectionViewDelegate>

@end


@implementation RightTableViewCell

- (void)setTitles:(NSArray *)titles {
    _titles = titles;
    [self.rightCollectionView reloadData];
}

- (UICollectionView *)rightCollectionView {
    if (_rightCollectionView == nil) {
        UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
        flow.itemSize = CGSizeMake(_rowW, _rowH);
        flow.minimumLineSpacing = 0;
        flow.minimumInteritemSpacing = 0;
        flow.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
//        CGRect rect = CGRectMake(0, 0, self.zyk_width, self.zyk_height);
        UICollectionView *rightCollection = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:flow];
        rightCollection.backgroundColor = [UIColor clearColor];
        rightCollection.dataSource = self;
        rightCollection.delegate = self.collectionDeletage;
//        rightCollection.bounces = NO;
        rightCollection.showsHorizontalScrollIndicator = NO;
        [self.contentView addSubview:rightCollection];
        //注册cell
        [rightCollection registerNib:[UINib nibWithNibName:NSStringFromClass([RightCollectionCell class]) bundle:nil] forCellWithReuseIdentifier:rightCollectionId];
        _rightCollectionView = rightCollection;
    }
    return _rightCollectionView;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.titles.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    RightCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:rightCollectionId forIndexPath:indexPath];
    cell.numberL.text = _titles[indexPath.row];
    return cell;
}

//-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    CGFloat offsetX = scrollView.contentOffset.x;
//    CGFloat offsetY = scrollView.contentOffset.y;
//    NSLog(@"offsetX=%lf  offsetY=%lf",offsetX,offsetY);
//}

@end
