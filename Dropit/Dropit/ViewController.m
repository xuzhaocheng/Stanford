//
//  ViewController.m
//  Dropit
//
//  Created by xuzhaocheng on 14-10-9.
//  Copyright (c) 2014年 Zhejiang University. All rights reserved.
//

#import "ViewController.h"
#import "DropitBehavior.h"
#import "BezierPathView.h"

@interface ViewController () <UIDynamicAnimatorDelegate>
@property (weak, nonatomic) IBOutlet BezierPathView *gameView;
@property (strong, nonatomic) UIDynamicAnimator *animator;
@property (strong, nonatomic) DropitBehavior *dropitBehavior;
@property (strong, nonatomic) UIAttachmentBehavior *attachment;
@property (strong, nonatomic) UIView *droppingView;
@end

@implementation ViewController

#pragma mark - Properties
- (DropitBehavior *)dropitBehavior
{
    if (!_dropitBehavior) {
        _dropitBehavior = [[DropitBehavior alloc] init];
        [self.animator addBehavior:_dropitBehavior];
    }
    return _dropitBehavior;
}

- (UIDynamicAnimator *)animator
{
    if (!_animator) {
        _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.gameView];
        _animator.delegate = self;
    }
    return _animator;
}

#pragma mark - UIDynamicAnimator Delegate
- (void)dynamicAnimatorDidPause:(UIDynamicAnimator *)animator
{
    [self removeCompletedRows];
}

- (BOOL)removeCompletedRows
{
    NSMutableArray *dropsToRemove = [[NSMutableArray alloc] init];
    
    for (CGFloat y = self.gameView.bounds.size.height - DROPIT_SIZE.height/2; y >= 0; y -= DROPIT_SIZE.height) {
        BOOL rowIsCompleted = YES;
        NSMutableArray *dropsFound = [[NSMutableArray alloc] init];
        for (CGFloat x = DROPIT_SIZE.width / 2; x <= self.gameView.bounds.size.width - DROPIT_SIZE.width/2; x += DROPIT_SIZE.width) {
            UIView *view = [self.gameView hitTest:CGPointMake(x, y) withEvent:nil];
            if (view.superview == self.gameView) {
                [dropsFound addObject:view];
            } else {
                rowIsCompleted = NO;
                break;
            }
        }
        
        if (![dropsFound count]) break;
        if (rowIsCompleted) {
            [dropsToRemove addObjectsFromArray:dropsFound];
        }
    }
    
    if ([dropsToRemove count]) {
        for (UIView *view in dropsToRemove) {
            [self.dropitBehavior removeItem:view];
        }
        [self animateRemovingDrops:dropsToRemove];
    }
    return NO;
}

- (void)animateRemovingDrops:(NSArray *)dropsToRemove
{
    [UIView animateWithDuration:1.0
                     animations:^{
                         for (UIView *drop in dropsToRemove) {
                             int x = (arc4random()%(int)(self.gameView.bounds.size.width*5)) - (int)self.gameView.bounds.size.width*2;
                             int y = self.gameView.bounds.size.height;
                             drop.center = CGPointMake(x, -y);
                         }
                     } completion:^(BOOL finished) {
                         [dropsToRemove makeObjectsPerformSelector:@selector(removeFromSuperview)];
                     }];
}

- (IBAction)tap:(id)sender
{
    [self drop];
}

- (IBAction)pin:(UIPanGestureRecognizer *)sender
{
    CGPoint gesturePoint = [sender locationInView:self.gameView];
    
    if (sender.state == UIGestureRecognizerStateBegan) {
        [self attachDroppingViewToPoint:gesturePoint];
    } else if (sender.state == UIGestureRecognizerStateChanged) {
        self.attachment.anchorPoint = gesturePoint;
    } else if (sender.state == UIGestureRecognizerStateEnded) {
        [self.animator removeBehavior:self.attachment];
        self.gameView.path = nil;
    }
    
}

- (void)attachDroppingViewToPoint:(CGPoint)anchorPoint
{
    if (self.droppingView) {
        self.attachment = [[UIAttachmentBehavior alloc] initWithItem:self.droppingView attachedToAnchor:anchorPoint];
        __weak ViewController *weakSelf = self;
        UIView *droppingView = self.droppingView;
        self.attachment.action = ^{
            UIBezierPath *path = [UIBezierPath bezierPath];
            [path moveToPoint:weakSelf.attachment.anchorPoint];
            [path addLineToPoint:droppingView.center];
            weakSelf.gameView.path = path;
        };
        
        self.droppingView = nil;
        [self.animator addBehavior:self.attachment];
    }
}

static const CGSize DROPIT_SIZE = { 40, 40 };

- (void)drop
{
    CGRect frame;
    frame.origin = CGPointZero;
    frame.size = DROPIT_SIZE;
    
    int x = arc4random()%(int)self.gameView.frame.size.width / (int)DROPIT_SIZE.width;
    frame.origin.x = x * DROPIT_SIZE.width;
    
    UIView *dropView = [[UIView alloc] initWithFrame:frame];
    dropView.backgroundColor = [self randomColor];
    [self.gameView addSubview:dropView];
    
    self.droppingView = dropView;
    
    [self.dropitBehavior addItem:dropView];
}

- (UIColor *)randomColor
{
    return [UIColor colorWithRed:(arc4random()%256)/256.0
                           green:(arc4random()%256)/256.0
                            blue:(arc4random()%256)/256.0
                           alpha:1.0];
}



@end
