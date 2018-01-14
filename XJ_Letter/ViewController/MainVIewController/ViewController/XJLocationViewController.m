//
//  XJLocationViewController.m
//  XJ_Letter
//
//  Created by 白 浩洋 on 2018/1/14.
//  Copyright © 2018年 ZhangJ. All rights reserved.
//

#import "XJLocationViewController.h"

@interface XJLocationViewController ()

@end

@implementation XJLocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationBarStyle];
}
-(void)setNavigationBarStyle{
    [self addCustomTitleWithTitle:@"所在位置"];
    [self addCustomBackBarButtonItemWithTarget:self action:@selector(backUp)];
    UIButton *rBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
    [rBtn setTitle:@"完成" forState:UIControlStateNormal];
    [rBtn.titleLabel setFont:[UIFont systemFontOfSize:PXChange(28)]];
    [rBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [rBtn addTarget:self action:@selector(backUp) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc]initWithCustomView:rBtn];
    self.view.backgroundColor = [UIColor whiteColor];
}
- (void)backUp{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
