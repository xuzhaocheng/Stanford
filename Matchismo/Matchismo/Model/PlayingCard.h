//
//  PlayingCard.h
//  Matchismo
//
//  Created by xuzhaocheng on 14-5-28.
//  Copyright (c) 2014年 Zhejiang University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end
