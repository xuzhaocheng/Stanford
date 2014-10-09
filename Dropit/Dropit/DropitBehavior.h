//
//  DropitBehavior.h
//  Dropit
//
//  Created by xuzhaocheng on 14-10-9.
//  Copyright (c) 2014年 Zhejiang University. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DropitBehavior : UIDynamicBehavior
- (void)addItem: (id <UIDynamicItem>)item;
- (void)removeItem: (id <UIDynamicItem>)item;
@end
