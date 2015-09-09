//
//  User.h
//  card
//
//  Created by tmachc on 15/9/9.
//  Copyright (c) 2015年 tmachc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic, readonly) NSMutableArray *myCards;

/**
 *  出牌
 *
 *  @param cards 所出的牌
 */
- (void)outCards:(NSArray *)cards;

/**
 *  获取我的牌总数
 *
 *  @return 总数
 */
- (NSInteger)getMyCardTotals;

@end
