//
//  XJModifyPassWordViewController.m
//  XJ_Letter
//
//  Created by 白浩洋 on 2018/1/9.
//  Copyright © 2018年 ZhangJ. All rights reserved.
//

#import "XJModifyPassWordViewController.h"

@interface XJModifyPassWordViewController ()
@property (nonatomic,strong)UITextField *yuanMima;
@property (nonatomic,strong)UITextField *XinMima;
@property (nonatomic,strong)UITextField *queRenMima;
@end

@implementation XJModifyPassWordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addCustomTitleWithTitle:@"修改密码"];
    [self addCustomBackBarButtonItemWithTarget:self action:@selector(backUp)];
    self.view.backgroundColor = [UIColor colorWithHexString:@"#f7f7f7"];
    [self setUpUI];
}
-(void)setUpUI{
    UIView *yuanView = [[UIView alloc]initWithFrame:CGRectMake(PXChange(40), PXChange(40), ScreenWidth-PXChange(80), PXChange(88))];
    yuanView.clipsToBounds = YES;
    yuanView.backgroundColor = [UIColor whiteColor];
    yuanView.layer.cornerRadius = PXChange(8);
    yuanView.layer.borderColor = [UIColor colorWithHexString:@"#c5c5c5"].CGColor;
    yuanView.layer.borderWidth = PXChange(1);
    [self.view addSubview:yuanView];
    
    UILabel *mima1 = [[UILabel alloc]initWithFrame:CGRectMake(PXChange(20), PXChange(10), PXChange(100), PXChange(68))];
    mima1.text = @"原  密  码";
    [mima1 sizeToFit];
    mima1.centerY = yuanView.height/2.0f;
    [yuanView addSubview:mima1];
    
    self.yuanMima = [[UITextField alloc]initWithFrame:CGRectMake(mima1.right+PXChange(40), 0, yuanView.width-mima1.right-PXChange(40), PXChange(68))];
    self.yuanMima.placeholder = @"请输入原密码";
    self.yuanMima.centerY = yuanView.height/2.0f;
    [yuanView addSubview:self.yuanMima];
    
    UIView *yuanView1 = [[UIView alloc]initWithFrame:CGRectMake(PXChange(40), PXChange(28)+yuanView.bottom, ScreenWidth-PXChange(80), PXChange(88))];
    yuanView1.clipsToBounds = YES;
    yuanView1.backgroundColor = [UIColor whiteColor];
    yuanView1.layer.cornerRadius = PXChange(8);
    yuanView1.layer.borderColor = [UIColor colorWithHexString:@"#c5c5c5"].CGColor;
    yuanView1.layer.borderWidth = PXChange(1);
    [self.view addSubview:yuanView1];
    
    UILabel *mima2 = [[UILabel alloc]initWithFrame:CGRectMake(PXChange(20), PXChange(10), PXChange(100), PXChange(68))];
    mima2.text = @"新  密  码";
    [mima2 sizeToFit];
    mima2.centerY = yuanView1.height/2.0f;
    [yuanView1 addSubview:mima2];
    
    self.XinMima = [[UITextField alloc]initWithFrame:CGRectMake(mima1.right+PXChange(40), 0, yuanView.width-mima1.right-PXChange(40), PXChange(68))];
    self.XinMima.placeholder = @"请输入原密码";
    self.XinMima.centerY = yuanView1.height/2.0f;
    [yuanView1 addSubview:self.XinMima];
    
    
    UIView *yuanView2 = [[UIView alloc]initWithFrame:CGRectMake(PXChange(40), PXChange(28)+yuanView1.bottom, ScreenWidth-PXChange(80), PXChange(88))];
    yuanView2.clipsToBounds = YES;
    yuanView2.backgroundColor = [UIColor whiteColor];
    yuanView2.layer.cornerRadius = PXChange(8);
    yuanView2.layer.borderColor = [UIColor colorWithHexString:@"#c5c5c5"].CGColor;
    yuanView2.layer.borderWidth = PXChange(1);
    [self.view addSubview:yuanView2];
    
    UILabel *mima3 = [[UILabel alloc]initWithFrame:CGRectMake(PXChange(20), PXChange(10), PXChange(100), PXChange(68))];
    mima3.text = @"确认密码";
    [mima3 sizeToFit];
    mima3.centerY = yuanView2.height/2.0f;
    [yuanView2 addSubview:mima3];
    self.queRenMima = [[UITextField alloc]initWithFrame:CGRectMake(mima1.right+PXChange(40), 0, yuanView.width-mima1.right-PXChange(40), PXChange(68))];
    self.queRenMima.placeholder = @"请输入原密码";
    self.queRenMima.centerY = yuanView2.height/2.0f;
    [yuanView2 addSubview:self.queRenMima];
    
    UIButton * changeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    changeButton.layer.cornerRadius = 7.0f;
    changeButton.frame = CGRectMake(PXChange(24), CGRectGetMaxY(yuanView2.frame)+PXChange(80), self.view.frame.size.width - PXChange(48), PXChange(80));
    changeButton.backgroundColor = [UIColor colorWithHexString:@"#808954"];
    [changeButton setTitle:@"修改密码" forState:UIControlStateNormal];
    [changeButton addTarget:self action:@selector(changBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:changeButton];
    
}
-(void)changBtnClick{
    NSLog(@"修改密码");
}
- (void)backUp{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
