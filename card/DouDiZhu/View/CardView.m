//
//  CardView.m
//  card
//
//  Created by tmachc on 15/9/11.
//  Copyright (c) 2015年 tmachc. All rights reserved.
//

#import "CardView.h"
#import "Masonry.h"
#import "PlayingCard.h"

@implementation CardView

- (instancetype)initWithPlayingCard:(PlayingCard *)card
{
    self = [super init];
    if (self) {
        self.layer.cornerRadius = 5;
        self.layer.borderWidth = 2;
        self.layer.borderColor = [UIColor grayColor].CGColor;
        self.backgroundColor = [UIColor whiteColor];
        UILabel *contentLab = [UILabel new];
//        NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:card.contents];
//        [str addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(str.length - 2, 1)];  // range代表从第几个开始，一共几个
//        contentLab.attributedText = str;
        contentLab.text = card.contents;
        NSLog(@"card.rank--->>>%lu",(unsigned long)card.rank);
        if ([card.suit isEqualToString:@"♥︎"] || [card.suit isEqualToString:@"♦︎"] || card.rank > [PlayingCard maxRank] + 1) {
            contentLab.textColor = [UIColor redColor];
        }
        contentLab.textAlignment = NSTextAlignmentCenter;
        contentLab.font = [UIFont boldSystemFontOfSize:15];
        contentLab.numberOfLines = 0;
        [self addSubview:contentLab];
        [contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(3);
            make.top.mas_equalTo(0);
            make.width.mas_equalTo(20);
            make.height.mas_equalTo(45);
        }];
        
        UIButton *btn = [UIButton new];
        [btn addTarget:self action:@selector(outCard:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.width.height.mas_equalTo(self);
        }];
    }
    return self;
}

- (IBAction)outCard:(UIButton *)sender
{
    
}

@end
