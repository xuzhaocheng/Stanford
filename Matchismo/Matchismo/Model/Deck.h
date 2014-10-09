//
//  Deck.h
//  Matchismo
//
//  Created by xuzhaocheng on 14-5-28.
//  Copyright (c) 2014年 Zhejiang University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (void)addCard:(Card *)card;
- (Card *)drawRandomCard;

@end
