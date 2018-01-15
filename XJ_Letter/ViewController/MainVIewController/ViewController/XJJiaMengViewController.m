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
    
    UILabel *shangjiaDes = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, PXChange(360), PXChange(100))];
    shangjiaDes.text = @"上百万咖啡厅、书吧、超市便利店等商家已入驻";
    shangjiaDes.textColor = [UIColor colorWithHexString:@"#c8c8c8"];
    [shangjiaDes setFont:[UIFont systemFontOfSize:PXChange(28)]];
    shangjiaDes.numberOfLines = 2;
    shangjiaDes.center = CGPointMake(shangjiaDes.width/2.0f+PXChange(24)+ruzhuView.right, shangjiaDes.height/2.0f+shangjiaLabel.bottom);
    [view addSubview:shangjiaDes];
    
    UIButton *sqBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, PXChange(200), PXChange(88))];
    [sqBtn setTitle:@"立即申请" forState:UIControlStateNormal];
    [sqBtn setTitleColor:[UIColor colorWithHexString:@"#808954"] forState:UIControlStateNormal];
    sqBtn.center = CGPointMake(ScreenWidth-sqBtn.width/2.0f-PXChange(24), view.height/2.0f);
    sqBtn.layer.cornerRadius = PXChange(8);
    sqBtn.layer.borderColor = [UIColor colorWithHexString:@"#808954"].CGColor;
    sqBtn.layer.borderWidth = PXChange(2);
    sqBtn.clipsToBounds = YES;
    [sqBtn addTarget:self action:@selector(shenqingClick) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:sqBtn];
    
    UIView *viewOne = [[UIView alloc]initWithFrame:CGRectMake(0, PXChange(20)+view.bottom, ScreenWidth, PXChange(200))];
    viewOne.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:viewOne];
    
    UIImageView *hezuoView =[[UIImageView alloc]initWithFrame:CGRectMake(PXChange(24), 0, PXChange(100), PXChange(100))];
    hezuoView.image = [UIImage imageNamed:@"other_cooperation"];
    hezuoView.centerY = viewOne.height/2.0f;
    [viewOne addSubview:hezuoView];
    
    UILabel *qitaLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    qitaLabel.text = @"其他合作";
    qitaLabel.textColor = [UIColor blackColor];
    [qitaLabel sizeToFit];
    qitaLabel.center = CGPointMake(qitaLabel.width/2.0f+PXChange(24)+hezuoView.right, qitaLabel.height/2.0f+PXChange(30));
    [viewOne addSubview:qitaLabel];
    
    UILabel *qitaDes = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, PXChange(360), PXChange(100))];
    qitaDes.text = @"请联系WWW.xiujits.com";
    qitaDes.textColor = [UIColor colorWithHexString:@"#c8c8c8"];
    [qitaDes setFont:[UIFont systemFontOfSize:PXChange(28)]];
    qitaDes.numberOfLines = 2;
    qitaDes.center = CGPointMake(qitaDes.width/2.0f+PXChange(24)+ruzhuView.right, qitaDes.height/2.0f+qitaLabel.bottom);
    [viewOne addSubview:qitaDes];
    
    UITextView *tv =[[UITextView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth-PXChange(100), PXChange(300))];
    tv.backgroundColor = [UIColor clearColor];
    tv.center = CGPointMake(ScreenWidth/2.0f, ScreenHeight-tv.height/2.0f-PXChange(200));
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 5;// 字体的行间距
    paragraphStyle.alignment = NSTextAlignmentCenter;
    NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:PXChange(34)],NSParagraphStyleAttributeName:paragraphStyle};
    tv.attributedText = [[NSAttributedString alloc] initWithString:@"哈尔滨锈迹文化传媒有限公司\n公司网址:www.xiujits.com\n咨询电话:0451-51068317\n投稿QQ:2102748998" attributes:attributes];
    [self.view addSubview:tv];
    
}
- (void)backUp{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)shenqingClick{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
