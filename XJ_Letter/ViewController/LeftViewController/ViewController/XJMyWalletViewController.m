//
//  XJMyWalletViewController.m
//  XJ_Letter
//
//  Created by 白 浩洋 on 2018/1/2.
//  Copyright © 2018年 ZhangJ. All rights reserved.
//

#import "XJMyWalletViewController.h"

@interface XJMyWalletViewController ()

@end

@implementation XJMyWalletViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addCustomTitleWithTitle:@"我的钱包"];
    [self addCustomBackBarButtonItemWithTarget:self action:@selector(backUp)];
    [self setNavigationBarStyle];
}
-(void)setNavigationBarStyle{
    UIButton *jiaoyiBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, PXChange(100), PXChange(88))];
    [jiaoyiBtn setTitle:@"交易记录" forState:UIControlStateNormal];
    [jiaoyiBtn addTarget:self action:@selector(jiaoyiClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *jiaoyiBtnItem = [[UIBarButtonItem alloc]initWithCustomView:jiaoyiBtn];
//    self.navigationController.navigationBar.ri
}
-(void)jiaoyiClick{
    NSLog(@"交易记录");
}
- (void)backUp{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
