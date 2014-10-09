//
//  BezierPathView.m
//  Dropit
//
//  Created by xuzhaocheng on 14-10-9.
//  Copyright (c) 2014年 Zhejiang University. All rights reserved.
//

#import "BezierPathView.h"

@implementation BezierPathView
- (void)setPath:(UIBezierPath *)path
{
    _path = path;
    [self setNeedsDisplay];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    [self.path stroke];
}


@end
