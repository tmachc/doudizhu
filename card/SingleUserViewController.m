//
//  SingleUserViewController.m
//  card
//
//  Created by tmachc on 15/9/10.
//  Copyright (c) 2015年 tmachc. All rights reserved.
//

#import "SingleUserViewController.h"
#import "GameTable.h"
#import "PlayingCard.h"
#import "PlayingDeck.h"
#import "CardView.h"
#import "MyCards.h"
#import "AIforGame.h"

@interface SingleUserViewController () <EndThinkingDelegate>

@property (nonatomic, strong) MyCards *me;
@property (nonatomic, strong) AIforGame *computer1;
@property (nonatomic, strong) AIforGame *computer2;
@property (nonatomic, strong) PlayingDeck *deck;
@property (nonatomic, strong) GameTable *game;
@property (nonatomic, strong) NSArray *otherCards;

@end

@implementation SingleUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 创建三个 user
    // 创建一个游戏桌 三个user加入游戏桌
    // 游戏桌记录谁是地主，谁有下一轮的出牌权
    
    // 开始游戏，出牌，判断手牌是否为空，下一个出牌
    
    self.me.tag = 0;
    self.computer1.tag = 1;
    self.computer2.tag = 2;
    self.otherCards = @[
                        [self.deck getRandomCard],
                        [self.deck getRandomCard],
                        [self.deck getRandomCard]
                        ];
    NSLog(@"self.deck--->>>%ld",(long)[self.deck getCardTotals]);
    
    [self updateUI];
    
    [self start];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - function

- (void)updateUI
{
    for (id item in self.view.subviews) {
        [item removeFromSuperview];
    }
    
//    __weak __typeof(&*self)ws = self;
    NSArray *sortCards = [self.me.myCards sortCards];
    for (int i = 0; i < sortCards.count; i ++) {
        CardView *cardView = [[CardView alloc] initWithPlayingCard:sortCards[sortCards.count - i - 1]];
        [self.view addSubview:cardView];
        [cardView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(30 + i * 30);
            make.width.mas_equalTo(64);
            make.height.mas_equalTo(96);
            make.bottom.mas_equalTo(-20);
        }];
    }
    
    sortCards = [self.computer1.myCards sortCards];
    for (int i = 0; i < sortCards.count; i ++) {
        CardView *cardView = [[CardView alloc] initWithPlayingCard:sortCards[sortCards.count - i - 1]];
        [self.view addSubview:cardView];
        [cardView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(20 + i * 25);
            make.width.mas_equalTo(48);
            make.height.mas_equalTo(72);
            make.top.mas_equalTo(60);
        }];
    }
    
    sortCards = [self.computer2.myCards sortCards];
    for (int i = 0; i < sortCards.count; i ++) {
        CardView *cardView = [[CardView alloc] initWithPlayingCard:sortCards[sortCards.count - i - 1]];
        [self.view addSubview:cardView];
        [cardView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(100 + i * 30);
            make.width.mas_equalTo(48);
            make.height.mas_equalTo(72);
            make.top.mas_equalTo(160);
        }];
    }
}

- (void)start
{
    // 抢地主
    [self grabLandlord:nil];
}

#pragma mark - delegate

- (void)grabLandlord:(BOOL)isGrab withTag:(NSInteger)tag
{
    if (isGrab) {
        [[self userWithTag:tag] setLandlordWithOtherCards:self.otherCards];
        self.otherCards = @[];
        [self updateUI];
        // 开始出牌
        [[self userWithTag:tag] setTurn:YES];
        [[self userWithTag:(tag + 1) % 3] setTurn:NO];
        [[self userWithTag:(tag + 2) % 3] setTurn:NO];
        if (tag) {
            [[self userWithTag:tag] thinkingOutCards:self.otherCards];
        }
    }
    else {
        [[self userWithTag:(tag + 1) % 3] thinkingGrabLandlord];
    }
}
- (void)outCards:(NSArray *)cards withTag:(NSInteger)tag
{
    if (cards.count) {
        // 如果出牌了，修改Turn
        [[self userWithTag:tag] setTurn:YES];
        [[self userWithTag:(tag + 1) % 3] setTurn:NO];
        [[self userWithTag:(tag + 2) % 3] setTurn:NO];
        self.otherCards = cards;
    }
    else if ([self userWithTag:(tag + 1) % 3].isTurn) {
        // 如果下一家的Turn 那么这轮没人要 下一家随意出
        self.otherCards = @[];
    }
    
    [[self userWithTag:(tag + 1) % 3] thinkingOutCards:self.otherCards];
}

- (User *)userWithTag:(NSInteger)tag
{
    if (tag == 0) {
        return self.me;
    }
    else if (tag == 1) {
        return self.computer1;
    }
    else {
        return self.computer2;
    }
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

- (IBAction)grabLandlord:(UIButton *)sender
{
    // 玩家不抢 让ai抢地主
    [self.me.delegete grabLandlord:sender.tag withTag:self.me.tag];
}

- (IBAction)outCards:(UIButton *)sender
{
//    if ([self.me outCards: lastOut:]) {
//
//    }
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

#pragma mark - 延迟实例化

- (MyCards *)me
{
    if (!_me) {
        _me = [[MyCards alloc] init];
        [_me setCarsCount:17 usingDeck:self.deck];
        _me.delegete = self;
    }
    return _me;
}

- (AIforGame *)computer1
{
    if (!_computer1) {
        _computer1 = [[AIforGame alloc] init];
        [_computer1 setCarsCount:17 usingDeck:self.deck];
        _computer1.delegete = self;
    }
    return _computer1;
}

- (AIforGame *)computer2
{
    if (!_computer2) {
        _computer2 = [[AIforGame alloc] init];
        [_computer2 setCarsCount:17 usingDeck:self.deck];
        _computer2.delegete = self;
    }
    return _computer2;
}

- (PlayingDeck *)deck
{
    if (!_deck) {
        _deck = [[PlayingDeck alloc] init];
    }
    return _deck;
}

@end
