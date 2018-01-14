//
//  XJJiaMengViewController.m
//  XJ_Letter
//
//  Created by 白 浩洋 on 2018/1/14.
//  Copyright © 2018年 ZhangJ. All rights reserved.
//

#import "XJJiaMengViewController.h"

@interface XJJiaMengViewController ()

@end

@implementation XJJiaMengViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationBarStyle];
    self.view.backgroundColor = [UIColor colorWithHexString:@"#f7f7f7"];
    [self setUpUI];
}
- (void)setNavigationBarStyle{
    [self addCustomTitleWithTitle:@"加盟合作"];
    [self addCustomBackBarButtonItemWithTarget:self action:@selector(backUp)];
}
- (void)setUpUI{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, PXChange(20), ScreenWidth, PXChange(200))];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    
    UIImageView *ruzhuView =[[UIImageView alloc]initWithFrame:CGRectMake(PXChange(24), 0, PXChange(100), PXChange(100))];
    ruzhuView.image = [UIImage imageNamed:@"merchants_settled"];
    ruzhuView.centerY = view.height/2.0f;
    [view addSubview:ruzhuView];
    
    UILabel *shangjiaLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    shangjiaLabel.text = @"商家入驻";
    shangjiaLabel.textColor = [UIColor blackColor];
    [shangjiaLabel sizeToFit];
    shangjiaLabel.center = CGPointMake(shangjiaLabel.width/2.0f+PXChange(24)+ruzhuView.right, shangjiaLabel.height/2.0f+PXChange(30));
    [view addSubview:shangjiaLabel];
    
    UILabel *shangjiaDes = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, PXChange(400), PXChange(100))];
    shangjiaDes.text = @"上百万咖啡厅、书吧、超市便利店等商家已入驻";
    shangjiaDes.textColor = [UIColor colorWithHexString:@"#c8c8c8"];
    [shangjiaDes setFont:[UIFont systemFontOfSize:PXChange(28)]];
    shangjiaDes.numberOfLines = 2;
    shangjiaDes.center = CGPointMake(shangjiaDes.width/2.0f+PXChange(24)+ruzhuView.right, shangjiaDes.height/2.0f+shangjiaLabel.bottom);
    [view addSubview:shangjiaDes];
}
- (void)backUp{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
