//
//  AIforGame.m
//  card
//
//  Created by tmachc on 15/9/11.
//  Copyright (c) 2015年 tmachc. All rights reserved.
//

#import "AIforGame.h"

@interface AIforGame ()

@end

@implementation AIforGame

- (void)thinkingGrabLandlord
{
    [self.delegete grabLandlord:YES withTag:self.tag];
}

- (void)thinkingOutCards:(NSArray *)lastOutCards
{
    if (lastOutCards.count == 1) {
        for (int i = 0; i < self.myCards.count; i ++) {
            if ([self.myCards[i] biggerThan:lastOutCards.firstObject]) {
                if ([self outCards:@[self.myCards[i]] lastOut:lastOutCards]) {
                    [self.delegete outCards:@[self.myCards[i]] withTag:self.tag];
                    return;
                }
            }
        }
    }
    
    // 默认不出
    [self.delegete outCards:@[] withTag:self.tag];
}

@end
