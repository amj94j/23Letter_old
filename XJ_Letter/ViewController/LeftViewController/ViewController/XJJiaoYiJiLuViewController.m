//
//  XJJiaoYiJiLuViewController.m
//  XJ_Letter
//
//  Created by 白浩洋 on 2018/1/3.
//  Copyright © 2018年 ZhangJ. All rights reserved.
//

#import "XJJiaoYiJiLuViewController.h"
#import "XJJYJLTableViewCell.h"
@interface XJJiaoYiJiLuViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tabView;

@end

@implementation XJJiaoYiJiLuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationBarStyle];
    [self.tabView registerNib:[UINib nibWithNibName:@"XJJYJLTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"JYJLCELL"];
}
-(void)setNavigationBarStyle{
    [self addCustomTitleWithTitle:@"交易记录"];
    [self addCustomBackBarButtonItemWithTarget:self action:@selector(backUp)];
}
-(void)backUp{
    [self.navigationController popViewControllerAnimated:YES];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 50;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    XJJYJLTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JYJLCELL"];
    if(indexPath.row % 2 == 0){
        cell.tixianLabel.textColor = [UIColor colorWithHexString:@"#545a89"];
    }else{
        cell.tixianLabel.textColor = [UIColor colorWithHexString:@"#808954"];
    }
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
