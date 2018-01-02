//
//  XJPeopleViewController.m
//  XJ_Letter
//
//  Created by 白浩洋 on 2017/12/29.
//  Copyright © 2017年 ZhangJ. All rights reserved.
//

#import "XJPeopleViewController.h"
#import "XJPeopleTableViewCell.h"
@interface XJPeopleViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageview;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *guanzhuLabel;
@property (nonatomic,strong) NSMutableArray *dataSource;

@end

@implementation XJPeopleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self makeNavigationBar];
    [self.tableview registerNib:[UINib nibWithNibName:@"XJPeopleTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"XJPeopleTableViewCell"];
    self.iconImageview.width = PXChange(142);
    self.iconImageview.clipsToBounds = YES;
    self.iconImageview.layer.cornerRadius =  self.iconImageview.width/2.0f;
    [self.iconImageview sd_setImageWithURL:[NSURL URLWithString:@"http://cimg.163.com/news/0511/19/a18.jpg"]];
    self.userName.text = @"周杰伦";
    self.guanzhuLabel.text = @" 已关注 ";
    self.guanzhuLabel.clipsToBounds = YES;
    self.guanzhuLabel.layer.cornerRadius = 5;
    self.guanzhuLabel.layer.borderWidth = PXChange(2);
    self.guanzhuLabel.layer.borderColor = [UIColor whiteColor].CGColor;
}
- (void)makeNavigationBar{
    [self.navigationController.navigationBar setHidden:YES];
    [self.navigationController.navigationItem setHidesBackButton:YES];
    [self.navigationItem setHidesBackButton:YES];
    [self.navigationController.navigationBar.backItem setHidesBackButton:YES];
}
- (IBAction)backUp:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
    [self.navigationController.navigationBar setHidden:YES];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return PXChange(260);
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    XJPeopleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"XJPeopleTableViewCell"];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

@end
