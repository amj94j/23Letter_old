//
//  XJSettingViewController.m
//  XJ_Letter
//
//  Created by 白浩洋 on 2018/1/4.
//  Copyright © 2018年 ZhangJ. All rights reserved.
//

#import "XJSettingViewController.h"
#import "XJModifyNickNameViewController.h"
#import "XJModefyAddressViewController.h"
#import "XJHelpFeedBackViewController.h"
#import "XJModifyPassWordViewController.h"
#import "XJAboutViewController.h"
#import "XJJiaMengViewController.h"
@interface XJSettingViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tabView;
@property (strong,nonatomic)NSMutableArray *dateSource;
@property (strong,nonatomic)NSMutableArray *imageSource;
@property (weak, nonatomic) IBOutlet UIButton *logOutBtn;
@end

@implementation XJSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationBarStyle];
}
- (void)setNavigationBarStyle{
    [self addCustomTitleWithTitle:@"设置"];
    [self addCustomBackBarButtonItemWithTarget:self action:@selector(backUp)];
    self.tabView.separatorStyle = UITableViewCellSelectionStyleGray;
    self.logOutBtn.layer.cornerRadius = 7;
    self.logOutBtn.clipsToBounds = YES;
}
- (void)backUp{
    [self.navigationController popViewControllerAnimated:YES];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(!cell){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    }
    
    NSLog(@"%ld---%ld",indexPath.section,indexPath.row);
    cell.textLabel.text = self.dateSource[indexPath.section][indexPath.row];
    cell.detailTextLabel.text = @"123";
    cell.imageView.image = [UIImage imageNamed:self.imageSource[indexPath.section][indexPath.row]];
    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dateSource[section] count];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dateSource.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return PXChange(88);
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return PXChange(1);
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return PXChange(20);
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:{
            switch (indexPath.row) {
                case 0:{
                    [self modifyNickName];
                    
                }break;
                case 1:{
                    [self modifyAddress];
                }break;
                default:
                    break;
            }
        }break;
        case 1:{
            switch (indexPath.row) {
                case 0:{
                    [self changPassWord];
                }break;
                case 1:{
                    [self messageSetting];
                }break;
                default:
                    break;
            }
        }break;
        case 2:{
            switch (indexPath.row) {
            case 0:{
                [self cleanerHuancun];
            }break;
            case 1:{
                [self helpAndFeedBack];
            }break;
            default:
                break;
        }
        }break;
        case 3:{
            switch (indexPath.row) {
                case 0:{
                    [self bussinessIn];
                }break;
                case 1:{
                    [self About];
                }break;
                default:
                    break;
            }
        }break;
            
        default:
            break;
    }
}
-(NSMutableArray *)dateSource{
    if(!_dateSource){
        _dateSource = [NSMutableArray arrayWithArray:@[@[@"修改昵称",@"修改地址"],@[@"修改密码",@"消息设置"],@[@"清理缓存",@"帮助与反馈"],@[@"商户入驻",@"关于23号信"]]];
    }
    return _dateSource;
}

-(NSMutableArray *)imageSource{
    if(!_imageSource){
        _imageSource = [NSMutableArray arrayWithArray:@[@[@"set_nickname",@"set_map"],@[@"set_password",@"set_comment"],@[@"set_delete",@"set_help"],@[@"set_store",@"set_about"]]];
    }
    return _imageSource;
}
- (IBAction)logOutBtnClick:(id)sender {
    NSLog(@"点击了退出按钮");
}
-(void)modifyNickName{
    //修改昵称
    XJModifyNickNameViewController * mvc = [[XJModifyNickNameViewController alloc]init];
    mvc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:mvc animated:YES];
}
-(void)modifyAddress{
    //修改地址
    XJModefyAddressViewController *mac = [[XJModefyAddressViewController alloc]init];
    mac.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:mac animated:YES];
}
-(void)changPassWord{
    //修改密码
    XJModifyPassWordViewController  *xjpd = [[XJModifyPassWordViewController alloc]init];
    xjpd.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:xjpd animated:YES];
}
-(void)messageSetting{
    //消息设置
}
-(void)cleanerHuancun{
    //清理缓存
}
-(void)helpAndFeedBack{
    //帮助与反馈
    XJHelpFeedBackViewController  *xjfb = [[XJHelpFeedBackViewController alloc]init];
    xjfb.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:xjfb animated:YES];
}
-(void)bussinessIn{
    //商户入驻
    XJJiaMengViewController *xjjm = [[XJJiaMengViewController alloc]init];
    xjjm.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:xjjm animated:YES];
}
-(void)About{
    //关于23号信
    XJAboutViewController *abvc = [[XJAboutViewController alloc]init];
    abvc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:abvc animated:YES];
}
@end
