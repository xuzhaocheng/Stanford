//
//  DropitBehavior.m
//  Dropit
//
//  Created by xuzhaocheng on 14-10-9.
//  Copyright (c) 2014年 Zhejiang University. All rights reserved.
//

#import "DropitBehavior.h"

@interface DropitBehavior()
@property (nonatomic, strong) UIGravityBehavior *gravity;
@property (nonatomic, strong) UICollisionBehavior *collision;
@property (nonatomic, strong) UIDynamicItemBehavior *itemBehavior;
@end

@implementation DropitBehavior

- (UIGravityBehavior *)gravity
{
    if (!_gravity) {
        _gravity = [[UIGravityBehavior alloc] init];
        _gravity.magnitude = 1;
    }
    return _gravity;
}

- (UICollisionBehavior *)collision
{
    if (!_collision) {
        _collision = [[UICollisionBehavior alloc] init];
        _collision.translatesReferenceBoundsIntoBoundary = YES;
    }
    return _collision;
}

- (UIDynamicItemBehavior *)itemBehavior
{
    if (!_itemBehavior) {
        _itemBehavior = [[UIDynamicItemBehavior alloc] init];
        _itemBehavior.allowsRotation = NO;
    }
    return _itemBehavior;
}

- (id)init
{
    self = [super init];
    if (self) {
        [self addChildBehavior:self.gravity];
        [self addChildBehavior:self.itemBehavior];
        [self addChildBehavior:self.collision];
    }
    return self;
}

- (void)addItem: (id <UIDynamicItem>)item
{
    [self.gravity addItem:item];
    [self.itemBehavior addItem:item];
    [self.collision addItem:item];
}

- (void)removeItem: (id <UIDynamicItem>)item
{
    [self.gravity removeItem:item];
    [self.itemBehavior removeItem:item];
    [self.collision removeItem:item];
}

@end
