//
//  User.m
//  card
//
//  Created by tmachc on 15/9/9.
//  Copyright (c) 2015年 tmachc. All rights reserved.
//

#import "User.h"
#import "PlayingCard.h"

typedef NS_ENUM(NSInteger, OutCardsType) {
    KingBomb = 3,
    Bomb = 2,
    Other = 1
};

// 单牌，对，三个，三带一，三带对，四带二，顺子5个起，连对3个起，飞机，飞机带一，飞机带对
typedef NS_ENUM(NSInteger, OutCardsOtherType) {
    Single = 1,
    Double,
    Three,
    ThreeAndOne,
    ThreeAndDouble,
    Plane,
    PlaneAndOne,
    PlaneAndDouble,
    FourAndTwo,
    Straight,           // 顺子5个起
    MoreDouble          // 连对3个起
};

@interface User()

@property (nonatomic, readwrite) NSMutableArray *myCards;

@end

@implementation User

- (instancetype)init
{
    return nil;
}

- (NSMutableArray *)myCards
{
    if (!_myCards) {
        _myCards = [NSMutableArray new];
    }
    return _myCards;
}

#pragma mark 初始化
- (instancetype)initWithCarsCount:(NSInteger)count usingDeck:(PlayingDeck *)deck
{
    self = [super init];
    if (self) {
        // 拿13张牌
        for (int i = 0; i < count; i ++) {
            Card *card = [deck getRandomCard];
            self.myCards[i] = card;
        }
    }
    return self;
}

- (BOOL)outCards:(NSArray *)cards lastOut:(NSArray *)lastCards
{
    BOOL canOut = NO;
    /*
     1、先判断当前牌能不能出
     2、判断两个牌的类型 ----- 1）王炸 2）炸弹 3）其他（单牌，对，三个，三带一，三带对，四带二，顺子5个起，连对3个起，飞机）
     3、王炸直接出，炸弹判断一下上一次的类型大小，其他先判断类型，类型一样判断大小
     */
    
    
    
    return canOut;
}

@end
