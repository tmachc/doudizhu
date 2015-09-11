//
//  PlayingCard.m
//  card
//
//  Created by tmachc on 15/9/9.
//  Copyright (c) 2015年 tmachc. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard
@synthesize suit = _suit;

+ (NSArray *)rankStrings
{
    return @[@"?", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K", @"A", @"2"];
}

+ (NSArray *)validSuits
{
    return @[@"♠︎", @"♥︎", @"♣︎", @"♦︎"];
}

+ (NSUInteger)maxRank
{
    return [PlayingCard rankStrings].count - 1;
}

- (NSString *)contents
{
    return [self.suit stringByAppendingString:[PlayingCard rankStrings][self.rank]];
}

- (void)setSuit:(NSString *)suit
{
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

- (NSString *)suit
{
    return _suit ? _suit : @"";
}

- (BOOL)biggerThan:(PlayingCard *)card
{
    return self.rank > card.rank;
}

@end