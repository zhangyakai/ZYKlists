//
//  LinkedListView.h
//  CoolTest
//
//  Created by DTMobile on 2017/5/18.
//  Copyright © 2017年 DEV. All rights reserved.

/*
 使用方法:
 一:
 LinkedListView *topView = [[LinkedListView alloc] init];
 topView.rowH = 需要的尺寸;
 topView.rowW = 需要的尺寸;
 topview.leftViewBottomY = 需要的尺寸;
 topView.leftTopNames = 需要的内容;
 topView.leftNames = 需要的内容;
 topView.topTitleNames = 需要的内容;
 topView.rightTitleNames = 需要的内容;
 [topView setUpView];
 [self.view addSubview:topView];
 
 二 :
    LinkedListView *bottomView = [[LinkedListView alloc] init];
    bottomView.rowH = 需要的尺寸;
    bottomView.rowW = 需要的尺寸;
    bottomView.leftViewBottomY = 粗腰的尺寸;
    bottomView.leftTopNames = 需要的内容;
    bottomView.leftNames = 需要的内容;
    bottomView.topTitleNames = 需要的内容;
    bottomView.rightTitleNames = 需要的内容;
    [bottomView setUpView];
    [self.view addSubview:bottomView];
 
    //根据需要设置
    //隐藏不需要的控件
    bottomView.leftL.hidden = YES;
    //重设代理 
    bottomView.leftTableView.delegate = self;
    bottomView.leftTopTableView.delegate = self;
    bottomView.rightTableView.delegate = self;
 
    获取控件 进行其他需求操作
    self.ytdLeftTableView = bottomView.leftTableView;
    self.ytdLeftTopTableView = bottomView.leftTopTableView;
    self.ytdRightTableView = bottomView.rightTableView;
 

 
 */
//

#import <UIKit/UIKit.h>

static NSString *leftTableViewId = @"leftTableViewCell";
static NSString *topCollectionId = @"topCollectionCell";
static NSString *rightTableViewId = @"RightTableViewCell";

@interface LinkedListView : UIView
@property (nonatomic, assign)CGFloat rowH; //默认值为 30
@property (nonatomic, assign)CGFloat rowW;  //默认值为 70
@property (nonatomic, assign)CGFloat leftViewBottomY; //左侧单行lebal距底部的距离 默认值 -10
@property (nonatomic, assign)CGFloat leftViewWithd;
@property (nonatomic, assign)NSInteger rowNumbar; //总行数 默认值为 10

/****内部的控件****/
//左侧顶部空白的View
@property (nonatomic, strong)UIView *leftTopView;
//左侧竖写label
@property (nonatomic, strong)UILabel *leftL;
//左侧 上部tableView
@property (nonatomic, strong)UITableView *leftTopTableView;
//左侧下部tableView
@property (nonatomic, strong)UITableView *leftTableView;
//右侧显示值的tableView
@property (nonatomic, strong)UITableView *rightTableView;
//顶部列表collectionView
@property (nonatomic, strong)UICollectionView *topCollectionView;

//内部展示的内容
//左侧顶部标题
@property (nonatomic, copy)NSString *titleName;
//右侧顶部标题
@property (nonatomic, strong)NSArray *topTitleNames;
//左侧上部标题
@property (nonatomic, strong)NSArray *leftTopNames;
//最侧下部标题
@property (nonatomic, strong)NSArray *leftNames;
//右侧值
@property (nonatomic, strong)NSArray *rightTitleNames;

//保存了右侧所有的显示值得CollectionView的数组
@property (nonatomic, strong)NSMutableArray *rightCollectionViews;

- (void)setUpView;

@end
