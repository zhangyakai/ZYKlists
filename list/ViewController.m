//
//  ViewController.m
//  list
//
//  Created by DTMobile on 2017/5/19.
//  Copyright © 2017年 DTMobile. All rights reserved.
//

#import "ViewController.h"
#import "LinkedListView.h"

@interface ViewController ()

@property (strong, nonatomic)LinkedListView *linkedList;

@property (nonatomic, strong)NSArray *leftTopNames;
@property (nonatomic, strong)NSArray *leftNames;
@property (nonatomic, strong)NSArray *topTitleNames;


@end

@implementation ViewController

- (NSArray *)leftTopNames {
    if (_leftTopNames == nil) {
        _leftTopNames = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"10",@"10",@"10",@"10",@"10"];
    }
    return _leftTopNames;
}
- (NSArray *)leftNames {
    if (_leftNames == nil) {
        _leftNames = @[@"1111",@"2222",@"3333",@"4444",@"55555",@"6666",@"7777",@"8888",@"8888"@"8888",@"8888",@"8888",@"8888",@"8888",@"8888"];
    }
    return _leftNames;
}

- (NSArray *)topTitleNames {
    if (_topTitleNames == nil) {
        _topTitleNames = @[@"选项1",@"选项2",@"选项3",@"选项4",@"选项5",@"选项6",@"选项7",@"选项8",@"选项9",@"选项10"];
        
    }
    return _topTitleNames;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //按步骤执行 
    _linkedList = [[LinkedListView alloc] init];
    _linkedList.frame = CGRectMake(0, 60, ZYKSreenW, ZYKSreenH - 60);
    //1.初始化值
    _linkedList.rowH = 30;
    _linkedList.rowW = 70;
    _linkedList.titleName = @"白余烁";
    _linkedList.leftTopNames = self.leftTopNames;
    _linkedList.leftNames = self.leftNames;
    _linkedList.topTitleNames = self.topTitleNames;
    _linkedList.rightTitleNames = self.topTitleNames;
    _linkedList.rowNumbar = self.leftTopNames.count + self.leftNames.count;
    //2.设置值
    [_linkedList setUpView];
    
    //3.获取控件
    _linkedList.leftL.text = @"想写什么写什么";
    
    [self.view addSubview:self.linkedList];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
