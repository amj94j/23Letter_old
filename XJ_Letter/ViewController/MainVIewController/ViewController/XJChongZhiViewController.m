//
//  XJChongZhiViewController.m
//  XJ_Letter
//
//  Created by 白浩洋 on 2018/1/10.
//  Copyright © 2018年 ZhangJ. All rights reserved.
//

#import "XJChongZhiViewController.h"

@interface XJChongZhiViewController ()
@property (nonatomic,strong)UITextField *chongzhifiled;
@end

@implementation XJChongZhiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addCustomTitleWithTitle:@"充值"];
    [self addCustomBackBarButtonItemWithTarget:self action:@selector(backUp)];
    self.view.backgroundColor = [UIColor colorWithHexString:@"#f7f7f7"];
    [self setUpUI];
}
-(void)setUpUI{
    UILabel * chongzhiLabel = [[UILabel alloc]initWithFrame:CGRectMake(PXChange(24), PXChange(24), PXChange(300), PXChange(88))];
    chongzhiLabel.text = @"充值方式";
    chongzhiLabel.textColor = [UIColor blackColor];
    [chongzhiLabel sizeToFit];
    [self.view addSubview:chongzhiLabel];
    
    UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(0, chongzhiLabel.bottom + PXChange(24), ScreenWidth, PXChange(88))];
    [backView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:backView];
    
    UIImageView *aliPayIcon = [[UIImageView alloc]initWithFrame:CGRectMake(PXChange(24), 0, PXChange(60), PXChange(60))];
    aliPayIcon.image = [UIImage imageNamed:@"aplay"];
    aliPayIcon.centerY = backView.height/2.0f;
    [backView addSubview:aliPayIcon];
    
    UILabel * chongzhiLabelOne = [[UILabel alloc]initWithFrame:CGRectMake(PXChange(24)+aliPayIcon.right, PXChange(24), PXChange(300), PXChange(88))];
    chongzhiLabelOne.text = @"在线支付-支付宝";
    chongzhiLabelOne.textColor = [UIColor blackColor];
    [chongzhiLabelOne sizeToFit];
    chongzhiLabelOne.centerY = aliPayIcon.centerY;
    [backView addSubview:chongzhiLabelOne];
    
    UIButton *aliBtn = [[UIButton alloc]initWithFrame:CGRectMake(ScreenWidth-PXChange(74), 0, PXChange(50), PXChange(50))];
    [aliBtn setImage:[UIImage imageNamed:@"check_no"] forState:UIControlStateNormal];
    [aliBtn setImage:[UIImage imageNamed:@"check_sel"] forState:UIControlStateSelected];
    [aliBtn addTarget:self action:@selector(aliClick:) forControlEvents:UIControlEventTouchUpInside];
    aliBtn.centerY = aliPayIcon.centerY;
    [aliBtn setSelected:YES];
    [backView addSubview:aliBtn];
    
    UILabel * chongzhiValue = [[UILabel alloc]initWithFrame:CGRectMake(PXChange(24), PXChange(24)+backView.bottom, PXChange(300), PXChange(88))];
    chongzhiValue.text = @"充值金额";
    chongzhiValue.textColor = [UIColor blackColor];
    [chongzhiValue sizeToFit];
    [self.view addSubview:chongzhiValue];
    
    UIView *backViewTwo = [[UIView alloc]initWithFrame:CGRectMake(0, chongzhiValue.bottom + PXChange(24), ScreenWidth, PXChange(88))];
    [backViewTwo setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:backViewTwo];
    
    self.chongzhifiled = [[UITextField alloc]initWithFrame:CGRectMake(PXChange(24), 0, ScreenWidth, PXChange(88))];
    self.chongzhifiled.placeholder = @"请输入充值金额";
    [backViewTwo addSubview:self.chongzhifiled];
    
    UILabel * chongzhishuoming = [[UILabel alloc]initWithFrame:CGRectMake(PXChange(24), PXChange(24)+backViewTwo.bottom, PXChange(300), PXChange(88))];
    chongzhishuoming.text = @"一次性最多可充值1000.00元";
    chongzhishuoming.textColor = [UIColor colorWithHexString:@"#afafaf"];
    chongzhishuoming.font = [UIFont systemFontOfSize:PXChange(30)];
    [chongzhishuoming sizeToFit];
    [self.view addSubview:chongzhishuoming];
    
    UIButton *nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    nextBtn.layer.cornerRadius = 7.0f;
    nextBtn.frame = CGRectMake(PXChange(24), CGRectGetMaxY(chongzhishuoming.frame)+PXChange(100), self.view.frame.size.width - PXChange(48), PXChange(80));
    nextBtn.backgroundColor = [UIColor colorWithHexString:@"#808954"];
    [nextBtn setTitle:@"下一步" forState:UIControlStateNormal];
    [nextBtn addTarget:self action:@selector(nextClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nextBtn];
    
}
-(void)aliClick:(UIButton *)Sender{
    Sender.selected = !Sender.selected;
}
-(void)nextClick{
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"“23号信”想要打开“支付宝”" message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击了取消");
    }];
    [action setValue:[UIColor colorWithHexString:@"#a2a2a2"] forKey:@"_titleTextColor"];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击了打开");
    }];
    [alertController addAction:action];
    [alertController addAction:action1];
   [self presentViewController:alertController animated:YES completion:nil];
}
- (void)backUp{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
