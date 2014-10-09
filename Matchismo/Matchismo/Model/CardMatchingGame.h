//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by xuzhaocheng on 14-7-7.
//  Copyright (c) 2014年 Zhejiang University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"


@interface CardMatchingGame : NSObject

- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck;
- (void)chooseCardAtIndex:(NSUInteger)index;
- (Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly) NSInteger score;
//@property (nonatomic, readwrite) NSInteger mode;

@end
