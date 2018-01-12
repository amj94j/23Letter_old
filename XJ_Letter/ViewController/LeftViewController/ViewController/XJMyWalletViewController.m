//
//  XJMyWalletViewController.m
//  XJ_Letter
//
//  Created by 白 浩洋 on 2018/1/2.
//  Copyright © 2018年 ZhangJ. All rights reserved.
//

#import "XJMyWalletViewController.h"
#import "XJJiaoYiJiLuViewController.h"
#import "XJChongZhiViewController.h"
#import "XJTiXianViewController.h"
@interface XJMyWalletViewController ()
@property (weak, nonatomic) IBOutlet UILabel *moneyLabel;
@property (weak, nonatomic) IBOutlet UIButton *chongzhiBtn;
@property (weak, nonatomic) IBOutlet UIButton *tixianBtn;

@end

@implementation XJMyWalletViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationBarStyle];
    self.view.backgroundColor = [UIColor colorWithHexString:@"#f1f4f9"];
    self.moneyLabel.text = [NSString stringWithFormat:@"¥  %@",@"1588629.00"];
    self.chongzhiBtn.clipsToBounds = YES;
    self.tixianBtn.clipsToBounds = YES;
    self.chongzhiBtn.layer.cornerRadius = 5;
    self.tixianBtn.layer.cornerRadius = 5;
}
-(void)setNavigationBarStyle{
    [self addCustomTitleWithTitle:@"钱包"];
    [self addCustomBackBarButtonItemWithTarget:self action:@selector(backUp)];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(0, 0, PXChange(100), PXChange(44))];
    [button setTitle:@"交易记录" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithHexString:@"#2d2d2d"] forState:UIControlStateNormal];
    [button addTarget:self  action:@selector(jiaoyiClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *jiaoyiBtnItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = jiaoyiBtnItem;
}
-(void)jiaoyiClick{
    XJJiaoYiJiLuViewController  *xjv = [[XJJiaoYiJiLuViewController alloc]init];
    [self.navigationController pushViewController:xjv animated:YES];
}
- (IBAction)chongzhiClick:(id)sender {
    XJChongZhiViewController *xczvc  = [[XJChongZhiViewController alloc]init];
    [xczvc setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:xczvc animated:YES];
}
- (IBAction)tixianClick:(id)sender {
    XJTiXianViewController *xtxvc  = [[XJTiXianViewController alloc]init];
    [xtxvc setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:xtxvc animated:YES];
}

- (void)backUp{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
