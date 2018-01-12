//
//  XJTiXianViewController.m
//  XJ_Letter
//
//  Created by 白浩洋 on 2018/1/12.
//  Copyright © 2018年 ZhangJ. All rights reserved.
//

#import "XJTiXianViewController.h"

@interface XJTiXianViewController ()
@property (nonatomic,strong)UITextField *zhuanghufiled;
@property (nonatomic,strong)UITextField *namefiled;
@property (nonatomic,strong)UITextField *tixianfiled;
@property (nonatomic,strong)UILabel *cashValue;
@end

@implementation XJTiXianViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addCustomTitleWithTitle:@"提现"];
    [self addCustomBackBarButtonItemWithTarget:self action:@selector(backUp)];
    self.view.backgroundColor = [UIColor colorWithHexString:@"#f7f7f7"];
    [self setUpUI];
}
-(void)setUpUI{
    
    UIView *viewOne = [[UIView alloc]initWithFrame:CGRectMake(0, PXChange(20), ScreenWidth, PXChange(98))];
    [viewOne setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:viewOne];
    
    UILabel * cashLabel = [[UILabel alloc]initWithFrame:CGRectMake(PXChange(24), PXChange(24), PXChange(300), PXChange(88))];
    cashLabel.text = @"可用金额";
    cashLabel.textColor = [UIColor blackColor];
    cashLabel.font = [UIFont systemFontOfSize:PXChange(36)];
    [cashLabel sizeToFit];
    cashLabel.centerY = viewOne.height/2.0f;
    [viewOne addSubview:cashLabel];
    
    self.cashValue = [[UILabel alloc]initWithFrame:CGRectMake(ScreenWidth- PXChange(324), PXChange(24), PXChange(300), PXChange(88))];
    self.cashValue.text = @"¥65536279.00";
    self.cashValue.textAlignment = NSTextAlignmentRight;
    self.cashValue.textColor = [UIColor blackColor];
//    [self.cashValue sizeToFit];
    self.cashValue.centerY = viewOne.height/2.0f;
    [viewOne addSubview:self.cashValue];
    
    
    UILabel * zhuanghu = [[UILabel alloc]initWithFrame:CGRectMake(PXChange(24), PXChange(24)+viewOne.bottom, PXChange(300), PXChange(88))];
    zhuanghu.text = @"到账账户";
    zhuanghu.font = [UIFont systemFontOfSize:PXChange(32)];
    zhuanghu.textColor = [UIColor blackColor];
    [zhuanghu sizeToFit];
    [self.view addSubview:zhuanghu];
//
    UIView *viewTwo = [[UIView alloc]initWithFrame:CGRectMake(0, PXChange(24)+zhuanghu.bottom, ScreenWidth, PXChange(98))];
    [viewTwo setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:viewTwo];
    
    self.zhuanghufiled = [[UITextField alloc]initWithFrame:CGRectMake(PXChange(24), 0, ScreenWidth, PXChange(98))];
    self.zhuanghufiled.placeholder = @"请输入实名认证账户";
    [viewTwo addSubview:self.zhuanghufiled];
    
    UILabel * xingming = [[UILabel alloc]initWithFrame:CGRectMake(PXChange(24), PXChange(24)+viewTwo.bottom, PXChange(300), PXChange(88))];
    xingming.text = @"姓名";
    xingming.font = [UIFont systemFontOfSize:PXChange(32)];
    xingming.textColor = [UIColor blackColor];
    [xingming sizeToFit];
    [self.view addSubview:xingming];
    
    UIView *viewThree = [[UIView alloc]initWithFrame:CGRectMake(0, PXChange(24)+xingming.bottom, ScreenWidth, PXChange(98))];
    [viewThree setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:viewThree];
    
    self.namefiled = [[UITextField alloc]initWithFrame:CGRectMake(PXChange(24), 0, ScreenWidth, PXChange(98))];
    self.namefiled.placeholder = @"请输入账户认证的实名身份证号";
    [viewThree addSubview:self.namefiled];
    
    
    UILabel * tixian = [[UILabel alloc]initWithFrame:CGRectMake(PXChange(24), PXChange(24)+viewThree.bottom, PXChange(300), PXChange(88))];
    tixian.text = @"提现金额";
    tixian.font = [UIFont systemFontOfSize:PXChange(32)];
    tixian.textColor = [UIColor blackColor];
    [tixian sizeToFit];
    [self.view addSubview:tixian];
    
    UIView *viewFour = [[UIView alloc]initWithFrame:CGRectMake(0, PXChange(24)+tixian.bottom, ScreenWidth, PXChange(98))];
    [viewFour setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:viewFour];

    self.tixianfiled = [[UITextField alloc]initWithFrame:CGRectMake(PXChange(24), 0, ScreenWidth, PXChange(98))];
    self.tixianfiled.placeholder = @"请输入提现金额";
    [viewFour addSubview:self.tixianfiled];
//
    UILabel * mianLabel = [[UILabel alloc]initWithFrame:CGRectMake(PXChange(24), PXChange(24)+viewFour.bottom, PXChange(300), PXChange(88))];
    mianLabel.text = @"10元起提现(免服务费)";
    mianLabel.font = [UIFont systemFontOfSize:PXChange(32)];
    mianLabel.textColor = [UIColor colorWithHexString:@"#afafaf"];
    [mianLabel sizeToFit];
    [self.view addSubview:mianLabel];

    UIButton *nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    nextBtn.layer.cornerRadius = 7.0f;
    nextBtn.frame = CGRectMake(PXChange(24), CGRectGetMaxY(mianLabel.frame)+PXChange(50), self.view.frame.size.width - PXChange(48), PXChange(80));
    nextBtn.backgroundColor = [UIColor colorWithHexString:@"#808954"];
    [nextBtn setTitle:@"下一步" forState:UIControlStateNormal];
    [nextBtn addTarget:self action:@selector(nextClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nextBtn];
    
}
-(void)aliClick:(UIButton *)Sender{
    Sender.selected = !Sender.selected;
}
-(void)nextClick{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提现成功" message:@"将在24小时内转账成功" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击了打开");
    }];
    [alertController addAction:action1];
    [self presentViewController:alertController animated:YES completion:nil];
}
- (void)backUp{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
