//
//  LeftTableView.h
//  CoolTest
//
//  Created by DTMobile on 2017/5/17.
//  Copyright © 2017年 DEV. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LeftTableView : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameL;
@property (weak, nonatomic) IBOutlet UILabel *titleL;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *nameLeft;

@end
