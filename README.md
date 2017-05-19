# ZYKlists
多个tableView和collectionView的联动表格 
需要Masonry.h来进行布局

# 使用方法:
导入列表文件夹中的文件

    //按步骤执行 
    //0.初始化
    _linkedList = [[LinkedListView alloc] init];
    _linkedList.frame = CGRectMake(0, 60, ZYKSreenW, ZYKSreenH - 60);
    
    //1.设置值和数据源
    _linkedList.rowH = 30;
    _linkedList.rowW = 70;
    _linkedList.titleName = @"白余烁";
    _linkedList.leftTopNames = self.leftTopNames;
    _linkedList.leftNames = self.leftNames;
    _linkedList.topTitleNames = self.topTitleNames;
    _linkedList.rightTitleNames = self.topTitleNames;
    _linkedList.rowNumbar = self.leftTopNames.count + self.leftNames.count;
    
    //2.添加控件
    [_linkedList setUpView];
    
    //3.获取控件后可以对控件进行重写
    _linkedList.leftL.text = @"想写什么写什么";
    
    [self.view addSubview:self.linkedList];
