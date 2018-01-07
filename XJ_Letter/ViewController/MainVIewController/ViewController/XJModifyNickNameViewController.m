//
//  XJModifyNickNameViewController.m
//  XJ_Letter
//  修改昵称
//  Created by 白 浩洋 on 2018/1/7.
//  Copyright © 2018年 ZhangJ. All rights reserved.
//

#import "XJModifyNickNameViewController.h"

@interface XJModifyNickNameViewController ()

@end

@implementation XJModifyNickNameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationBarStyle];
    self.view.backgroundColor = [UIColor colorWithHexString:@"#f7f7f7"];
    [self setUpUI];
}
-(void)setNavigationBarStyle{
    [self addCustomTitleWithTitle:@"修改昵称"];
    [self addCustomBackBarButtonItemWithTarget:self action:@selector(backUp)];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(0, PXChange(40), PXChange(100), PXChange(44))];
    [button setTitle:@"确定" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithHexString:@"#2d2d2d"] forState:UIControlStateNormal];
    [button addTarget:self  action:@selector(quedingClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *quedingBtnItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = quedingBtnItem;
}
-(void)backUp{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)setUpUI{
    UIView *bgview = [[UIView alloc]initWithFrame:CGRectMake(0, PXChange(20), ScreenWidth, PXChange(88))];
    bgview.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bgview];
    self.nickName = [[UITextField alloc]initWithFrame:CGRectMake(PXChange(20), 0, ScreenWidth-PXChange(40), PXChange(88))];
    self.nickName.text = @"jay";
    self.nickName.placeholder = @"请输入新昵称";
    self.nickName.rightViewMode = UITextFieldViewModeWhileEditing;
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, PXChange(88), PXChange(88))];
    [btn setImage:[UIImage imageNamed:@"delete_photo"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(cleanerText) forControlEvents:UIControlEventTouchUpInside];
    self.nickName.rightView = btn;
    self.nickName.textColor = [UIColor colorWithHexString:@"#333333"];
    [bgview addSubview:self.nickName];
}
-(void)quedingClick{
    NSLog(@"确定");
    [self backUp];
}
-(void)cleanerText{
    self.nickName.text = @"";
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
