//
//  User.h
//  card
//
//  Created by tmachc on 15/9/9.
//  Copyright (c) 2015年 tmachc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PlayingDeck.h"

@interface User : NSObject

@property (nonatomic, readonly) NSMutableArray *myCards;
/*! @brief 是否拥有下一次的出牌权 */
@property (nonatomic, getter = isMyTurn) BOOL myTurn;

- (instancetype)initWithCarsCount:(NSInteger)count usingDeck:(PlayingDeck *)deck;

/**
 *  出牌
 *
 *  @param cards 所出的牌
 *
 *  @return 是否可以出
 */
- (BOOL)outCards:(NSArray *)cards lastOut:(NSArray *)lastCards;

@end
