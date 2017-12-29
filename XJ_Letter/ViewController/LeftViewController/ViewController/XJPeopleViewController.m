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
@property (nonatomic,strong) NSMutableArray *dataSource;

@end

@implementation XJPeopleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setHidden:YES];
    [self.tableview registerNib:[UINib nibWithNibName:@"XJPeopleTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"XJPeopleTableViewCell"];
    // Do any additional setup after loading the view from its nib.
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
