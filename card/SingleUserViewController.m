//
//  SingleUserViewController.m
//  card
//
//  Created by tmachc on 15/9/10.
//  Copyright (c) 2015年 tmachc. All rights reserved.
//

#import "SingleUserViewController.h"
#import "Masonry.h"
#import "GameTable.h"
#import "User.h"
#import "PlayingCard.h"
#import "PlayingDeck.h"
#import "CardView.h"

@interface SingleUserViewController ()

@end

@implementation SingleUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 创建三个 user
    // 创建一个游戏桌 三个user加入游戏桌
    // 游戏桌记录谁是地主，谁有下一轮的出牌权
    
    // 开始游戏，出牌，判断手牌是否为空，下一个出牌
    
    NSMutableArray *cards = [NSMutableArray new];
    for (int i = 0; i < 1; i ++) {
        for (int j = 0; j < 4; j ++) {
            PlayingCard *card1 = [PlayingCard new];
            card1.suit = [PlayingCard validSuits][j];
            card1.rank = i + 1;
            [cards addObject:card1];
        }
    }
    
//    PlayingCard *card1 = [PlayingCard new];
//    card1.suit = [PlayingCard validSuits][3];
//    card1.rank = 2;
//    [cards addObject:card1];
    PlayingCard *card2 = [PlayingCard new];
    card2.suit = [PlayingCard validSuits][3];
    card2.rank = 4;
    [cards addObject:card2];
    PlayingCard *card3 = [PlayingCard new];
    card3.suit = [PlayingCard validSuits][3];
    card3.rank = 5;
    [cards addObject:card3];
    PlayingCard *card4 = [PlayingCard new];
    card4.suit = [PlayingCard validSuits][2];
    card4.rank = 4;
    [cards addObject:card4];
    PlayingCard *card5 = [PlayingCard new];
    card5.suit = [PlayingCard validSuits][1];
    card5.rank = 9;
    [cards addObject:card5];
    
    for (int i = 0; i < cards.count; i ++) {
        NSLog(@"card-->>>%@",((PlayingCard *)cards[i]).contents);
    }
    
    NSLog(@"OtherType--->>>%ld",(long)[GameTable judgeOutCardsOtherTypeFor:cards]);
    
    __weak __typeof(&*self)ws = self;
    NSArray *sortCards = [cards sortCards];
    for (int i = 0; i < sortCards.count; i ++) {
        CardView *cardView = [[CardView alloc] initWithPlayingCard:sortCards[cards.count - i - 1]];
        [self.view addSubview:cardView];
        [cardView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(30 + i * 30);
            make.width.mas_equalTo(64);
            make.height.mas_equalTo(96);
            make.bottom.mas_equalTo(-20);
        }];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - button

- (IBAction)clickBack:(UIButton *)sender
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"确定退出" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    [alert addAction:cancelAction];
    [alert addAction:okAction];
    [self presentViewController:alert animated:YES completion:nil];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
