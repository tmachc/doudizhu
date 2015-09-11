//
//  CardView.h
//  card
//
//  Created by tmachc on 15/9/11.
//  Copyright (c) 2015年 tmachc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayingCard.h"

@interface CardView : UIView

- (instancetype)initWithPlayingCard:(PlayingCard *)card;

@end
