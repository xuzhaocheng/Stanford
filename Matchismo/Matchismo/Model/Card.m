//
//  Card.m
//  Matchismo
//
//  Created by xuzhaocheng on 14-5-28.
//  Copyright (c) 2014年 Zhejiang University. All rights reserved.
//

#import "Card.h"

@interface Card ()

@end

@implementation Card

- (int)match:(NSArray *)otherCards
{
    int score = 0;
    
    for (Card *card in otherCards) {
        if ([card.contents isEqualToString:self.contents]) {
            score = 1;
        }
    }
    
    return score;
}

@end
