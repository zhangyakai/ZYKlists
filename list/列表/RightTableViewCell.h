//
//  RightTableViewCell.h
//  CoolTest
//
//  Created by DTMobile on 2017/5/17.
//  Copyright © 2017年 DEV. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RightTableViewCell : UITableViewCell 
@property (nonatomic, assign)CGFloat rowW;
@property (nonatomic, assign)CGFloat rowH;

@property (nonatomic, strong)NSArray *titles;
@property (nonatomic, weak)id<UICollectionViewDelegate> collectionDeletage;

@property (nonatomic, strong)UICollectionView *rightCollectionView;
@end
