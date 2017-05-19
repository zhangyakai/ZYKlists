//
//  UIView+Frame.m
//  百思不得姐
//
//  Created by 张亚凯 on 16/4/25.
//  Copyright © 2016年 weilai. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)

- (void)setZyk_x:(CGFloat)zyk_x {
    
    CGRect frame = self.frame;
    frame.origin.x = zyk_x;
    self.frame = frame;
}

- (CGFloat)zyk_x {
    
    return self.frame.origin.x;
}

- (void)setZyk_y:(CGFloat)zyk_y {
    CGRect frame = self.frame;
    frame.origin.y = zyk_y;
    self.frame = frame;
}

- (CGFloat)zyk_y {
    return self.frame.origin.y;
}

- (void)setZyk_width:(CGFloat)zyk_width {
    
    CGRect frame = self.frame;
    
    frame.size.width = zyk_width;
    self.frame = frame;
}

- (CGFloat)zyk_width {
    return self.frame.size.width;
}

- (void)setZyk_height:(CGFloat)zyk_height {
    
    CGRect frame = self.frame;
    frame.size.height = zyk_height;
    self.frame = frame;
}

- (CGFloat)zyk_height {
    return self.frame.size.height;
}

- (void)setZyk_centerX:(CGFloat)zyk_centerX {
    CGPoint center = self.center;
    center.x = zyk_centerX;
    self.center = center;
}

- (CGFloat)zyk_centerX {
    
    return self.center.x;
}

- (void)setzyk_centerY:(CGFloat)zyk_centerY {
    CGPoint center = self.center;
    center.y = zyk_centerY;
    self.center = center;
}

- (CGFloat)zyk_centerY {
    
    return self.center.y;
}

@end










