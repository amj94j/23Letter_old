//
//  XJGuanZhuViewController.m
//  XJ_Letter
//
//  Created by 白浩洋 on 2017/12/29.
//  Copyright © 2017年 ZhangJ. All rights reserved.
//

#import "XJGuanZhuViewController.h"
#import "XJguanzhufansTableViewCell.h"
#import "XJPeopleViewController.h"
@interface XJGuanZhuViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)NSMutableArray *dataSource;
@end

@implementation XJGuanZhuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addCustomTitleWithTitle:@"我的关注"];
    [self addCustomBackBarButtonItemWithTarget:self action:@selector(backUp)];
    [self.tableView reloadData];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
   [self.navigationController.navigationBar setHidden:NO];
}
-(void)backUp{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark  ====tab协议方法
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    return self.dataSource.count;
 return 50;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    XJguanzhufansTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"guanzhufanscell"];
    cell.name.text = @"jay";
    cell.icon.layer.cornerRadius = cell.icon.width/2.0f;
    [cell.icon sd_setImageWithURL:[NSURL URLWithString:@"http://o97zrcc31.bkt.clouddn.com/bhy100.jpg"]];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return  PXChange(120);
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    XJPeopleViewController * xjbase = [[XJPeopleViewController alloc]init];
    [self.navigationController pushViewController:xjbase animated:YES];
}
#pragma mark  ====懒加载
-(NSMutableArray *)dataSource{
    if(!_dataSource){
        _dataSource = [[NSMutableArray alloc]init];
    }
    return _dataSource;
}
-(UITableView *)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, PXChange(20), ScreenWidth, ScreenHeight-64-PXChange(20)) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerNib:[UINib nibWithNibName:@"XJguanzhufansTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"guanzhufanscell"];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}
@end
