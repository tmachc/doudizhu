//
//  SingleUserViewController.m
//  card
//
//  Created by tmachc on 15/9/10.
//  Copyright (c) 2015年 tmachc. All rights reserved.
//

#import "SingleUserViewController.h"
#import "GameTable.h"
#import "User.h"

@interface SingleUserViewController ()

@end

@implementation SingleUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 创建三个 user
    // 创建一个游戏桌 三个user加入游戏桌
    // 游戏桌记录谁是地主，谁有下一轮的出牌权
    
    // 开始游戏，出牌，判断手牌是否为空，下一个出牌
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
