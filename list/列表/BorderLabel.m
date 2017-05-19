//
//  BorderLabel.m
//  CoolTest
//
//  Created by DTMobile on 2017/5/19.
//  Copyright © 2017年 DEV. All rights reserved.
//

#import "BorderLabel.h"

@implementation BorderLabel

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.borderWidth = 0.5;
        self.layer.borderColor = ZYKRGBColor(100, 100, 100, 0.5).CGColor;
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.layer.borderWidth = 0.5;
    self.layer.borderColor = ZYKRGBColor(100, 100, 100, 0.5).CGColor;
}
@end
