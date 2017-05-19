//
//  LinkedListView.m
//  CoolTest
//
//  Created by DTMobile on 2017/5/18.
//  Copyright © 2017年 DEV. All rights reserved.
//

#import "LinkedListView.h"

#import "topCollectionCell.h"
#import "LeftTableView.h"
#import "RightTableViewCell.h"

#import "BorderLabel.h"

#define subViewBackgroundColor ZYKColor(230, 230, 230)
@interface LinkedListView()<UITableViewDataSource,UICollectionViewDataSource,UITableViewDelegate,UICollectionViewDelegate>


@end

@implementation LinkedListView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = ZYKColor(210, 210, 210);
        self.layer.borderWidth = 0.5;
        self.layer.borderColor = ZYKRGBColor(100, 100, 100, 0.5).CGColor;
        _rowW = 70;
        _rowH = 30;
        _leftViewBottomY = -10;
        _rowNumbar = 10;
        _leftViewWithd = 30;
        self.leftNames = @[@"2",@"2",@"2",@"2",@"2",@"2"];
        self.leftTopNames = @[@"1",@"1",@"1",@"1",@"1",@"1"];
        self.topTitleNames = @[@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0"];
        self.rightTitleNames = @[@"4",@"4",@"4",@"4",@"4",@"4",@"4",@"4",@"4"];
        self.rightCollectionViews = [NSMutableArray array];
        
    }
    return self;
}


-(void)awakeFromNib {
    [super awakeFromNib];
    [self initWithLinke];
}

- (void)initWithLinke {
    self.backgroundColor = ZYKColor(210, 210, 210);
    self.layer.borderWidth = 0.5;
    self.layer.borderColor = ZYKRGBColor(100, 100, 100, 0.5).CGColor;
    _rowW = 70;
    _rowH = 30;
    _leftViewBottomY = -10;
    _rowNumbar = 10;
    _leftViewWithd = 30;
    self.leftNames = @[@"2",@"2",@"2",@"2",@"2",@"2"];
    self.leftTopNames = @[@"1",@"1",@"1",@"1",@"1",@"1"];
    self.topTitleNames = @[@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0"];
    self.rightTitleNames = @[@"4",@"4",@"4",@"4",@"4",@"4",@"4",@"4",@"4"];
    self.rightCollectionViews = [NSMutableArray array];
}

- (void)setUpView {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, _rowH)];
    view.backgroundColor = ZYKColor(200, 200, 200);
    [self addSubview:view];
    self.leftTopView = view;
    
    BorderLabel *leftTopLabel = [[BorderLabel alloc] init];
    leftTopLabel.text = _titleName;
    leftTopLabel.numberOfLines = 0;
    leftTopLabel.font = [UIFont systemFontOfSize:13];
    leftTopLabel.backgroundColor = subViewBackgroundColor;
    [view addSubview:leftTopLabel];
    
    [leftTopLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view.mas_top);
        make.left.equalTo(view.mas_left);
        make.right.equalTo(view.mas_right);
        make.bottom.equalTo(view.mas_bottom);
    }];
    
    /******顶部列表******/
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    flow.itemSize = CGSizeMake(_rowW, _rowH);
    flow.minimumLineSpacing = 0;
    flow.minimumInteritemSpacing = 0;
    flow.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    CGRect rect = CGRectMake(view.zyk_width, 0, ZYKSreenW - 40 - _rowW, _rowH);
    UICollectionView *topCollection = [[UICollectionView alloc] initWithFrame:rect collectionViewLayout:flow];
    topCollection.backgroundColor = ZYKColor(200, 200, 200);
    topCollection.dataSource = self;
    topCollection.delegate = self;
    //    topCollection.bounces = NO;
    topCollection.showsHorizontalScrollIndicator = NO;
    [self addSubview:topCollection];
    //注册cell
    [topCollection registerNib:[UINib nibWithNibName:NSStringFromClass([topCollectionCell class]) bundle:nil] forCellWithReuseIdentifier:topCollectionId];
    
    [topCollection mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.left.equalTo(view.mas_right);
        make.height.offset(_rowH);
        make.right.equalTo(self.mas_right);
    }];
    self.topCollectionView = topCollection;
    
    /*******左侧的控件*******/
    UIView *leftView = [[UIView alloc] init];
    leftView.backgroundColor = ZYKColor(210, 210, 210);
    leftView.layer.masksToBounds = YES;
    [self addSubview:leftView];
    
    [leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view.mas_bottom);
        make.left.equalTo(self.mas_left);
        make.width.equalTo(view.mas_width);
        make.bottom.equalTo(self.mas_bottom);
    }];
    
    UITableView *leftTableView = [[UITableView alloc] init];
    leftTableView.backgroundColor = ZYKColor(210, 210, 210);
    leftTableView.tag = 0;
    leftTableView.dataSource = self;
    leftTableView.delegate = self;
    leftTableView.rowHeight = _rowH;
    leftTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    leftTableView.showsVerticalScrollIndicator = NO;
    [leftView addSubview:leftTableView];
    //注册cell
    [leftTableView registerNib:[UINib nibWithNibName:NSStringFromClass([LeftTableView class]) bundle:nil] forCellReuseIdentifier:leftTableViewId];
    
    [leftTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(leftView.mas_top);
        make.left.equalTo(leftView.mas_left);
        make.width.equalTo(leftView.mas_width);
        make.bottom.equalTo(leftView.mas_bottom);
    }];
    self.leftTableView = leftTableView;
    
    UITableView *leftTopTableView = [[UITableView alloc] init];
    leftTopTableView.backgroundColor = [UIColor clearColor];
    leftTopTableView.tag = 1;
    leftTopTableView.dataSource = self;
    leftTopTableView.delegate = self;
    leftTopTableView.rowHeight = _rowH;
    leftTopTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    leftTopTableView.showsVerticalScrollIndicator = NO;

    
    [leftView addSubview:leftTopTableView];
    //注册cell
    [leftTopTableView registerNib:[UINib nibWithNibName:NSStringFromClass([LeftTableView class]) bundle:nil] forCellReuseIdentifier:leftTableViewId];
    
    [leftTopTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(leftView.mas_top);
        make.left.equalTo(leftView.mas_left).offset(_leftViewWithd);
        make.right.equalTo(leftView.mas_right);
        make.bottom.equalTo(leftView.mas_bottom);
    }];
    self.leftTopTableView = leftTopTableView;
    
    
    BorderLabel *leftL = [[BorderLabel alloc] init];
    leftL.backgroundColor = subViewBackgroundColor;
    leftL.text = @"各时段工单数统计";
    leftL.numberOfLines = 0;
    leftL.textAlignment = NSTextAlignmentCenter;
    [leftView addSubview:leftL];
    self.leftL = leftL;
    [leftL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(leftView.mas_top);
        make.left.equalTo(leftView.mas_left);
        make.right.equalTo(leftTopTableView.mas_left);
        make.height.offset(self.leftTopNames.count * _rowH);
    }];
    
    
    /******右侧列表******/
    UITableView *rightTableView = [[UITableView alloc] init];
    rightTableView.backgroundColor = ZYKColor(210, 210, 210);
    rightTableView.tag = 2;
    rightTableView.dataSource = self;
    rightTableView.delegate = self;
    rightTableView.rowHeight = _rowH;
    rightTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    rightTableView.showsVerticalScrollIndicator = NO;
    [self addSubview:rightTableView];
    //注册cell
    [rightTableView registerClass:[RightTableViewCell class] forCellReuseIdentifier:rightTableViewId];
    self.rightTableView = rightTableView;
    
    [rightTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(topCollection.mas_bottom);
        make.left.equalTo(view.mas_right);
        make.bottom.equalTo(self.mas_bottom);
        make.right.equalTo(self.mas_right);
    }];
    //根据需要来设置额外滚动距离
    [self setTableViewOffest];
}

//根据需要来设置额外滚动距离
- (void)setTableViewOffest {
    
    _leftTopTableView.contentInset = UIEdgeInsetsMake(0,0, _rowH * self.leftNames.count, 0);
    _leftTableView.contentInset = UIEdgeInsetsMake(_rowH * self.leftTopNames.count, 0, 0, 0 );
    _leftTableView.contentOffset = CGPointMake(0, -_rowH * self.leftTopNames.count);
    
}

#define leftTableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView.tag == 0) {
        return self.leftNames.count;
    }else if (tableView.tag == 1) {
        return self.leftTopNames.count;
    }else if (tableView.tag == 2) {
        return _rowNumbar;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int num = indexPath.row % 2;
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    if (tableView.tag == 0) {
        
        LeftTableView *leftCell = [tableView dequeueReusableCellWithIdentifier:leftTableViewId ];
        cell.tag = indexPath.row;
        if (cell == nil) {
            leftCell = [[LeftTableView alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:leftTableViewId];
        }
        leftCell.nameL.text = self.leftNames[indexPath.row];
        cell = leftCell;
        if (num == 0) {
            cell.backgroundColor = subViewBackgroundColor;
        }else if (num == 1) {
            cell.backgroundColor = [UIColor whiteColor];
        }

    }else if (tableView.tag == 2) {
        
        RightTableViewCell *rightCell = [tableView dequeueReusableCellWithIdentifier:rightTableViewId forIndexPath:indexPath];
        if (rightCell == nil) {
            rightCell = [[RightTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:rightTableViewId];
        }
        rightCell.collectionDeletage = self;
        rightCell.rowW = _rowW;
        rightCell.rowH = _rowH;
        rightCell.titles = self.rightTitleNames;
        cell = rightCell;
        [self.rightCollectionViews addObject:rightCell.rightCollectionView];
        if (num == 0) {
            cell.backgroundColor = [UIColor whiteColor];
        }else if (num == 1) {
            cell.backgroundColor = subViewBackgroundColor;
        }
    }
    else if (tableView.tag == 1) {
        
        LeftTableView *leftCell = [tableView dequeueReusableCellWithIdentifier:leftTableViewId forIndexPath:indexPath];
        if (cell == nil) {
            leftCell = [[LeftTableView alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:leftTableViewId];
        }
        leftCell.nameL.text = self.leftTopNames[indexPath.row];
        cell = leftCell;
        
        
        if (num == 0) {
            cell.backgroundColor = [UIColor whiteColor];
        }else if (num == 1) {
            cell.backgroundColor = subViewBackgroundColor;
        }
    }
    
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
    return cell;
}

#define topCollectionDatasource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.topTitleNames.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    topCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:topCollectionId forIndexPath:indexPath];
    cell.numberL.text = self.topTitleNames[indexPath.row];
    return cell;
}

#define scrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offsetX = scrollView.contentOffset.x;
    CGFloat offsetY = scrollView.contentOffset.y;
    
    if ([scrollView isKindOfClass:[UICollectionView class]]) {
        self.topCollectionView.contentOffset = scrollView.contentOffset;
        for (UICollectionView *collection in self.rightCollectionViews) {
            collection.contentOffset = scrollView.contentOffset;
        }
        
    }else if (scrollView == self.leftTopTableView) {
        self.leftTableView.contentOffset = CGPointMake(0, offsetY - _rowH * self.leftTopNames.count);
        self.rightTableView.contentOffset = scrollView.contentOffset;
        self.leftL.zyk_y = -offsetY;
    }else if (scrollView == self.leftTableView) {
        self.leftL.zyk_y = -(offsetY + _rowH * self.leftTopNames.count);
        self.rightTableView.contentOffset = CGPointMake(0, offsetY + _rowH * self.leftTopNames.count);
        self.leftTopTableView.contentOffset = CGPointMake(0, offsetY + _rowH * self.leftTopNames.count);
    }else if (scrollView == self.rightTableView) {
        self.leftL.zyk_y = -offsetY;
        self.leftTopTableView.contentOffset = scrollView.contentOffset;
        self.leftTableView.contentOffset = CGPointMake(0, offsetY - _rowH * self.leftTopNames.count);
    }
}

@end
