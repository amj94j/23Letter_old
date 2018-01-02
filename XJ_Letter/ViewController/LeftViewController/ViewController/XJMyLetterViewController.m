//
//  XJMyLetterViewController.m
//  XJ_Letter
//
//  Created by 白浩洋 on 2018/1/2.
//  Copyright © 2018年 ZhangJ. All rights reserved.
//

#import "XJMyLetterViewController.h"

@interface XJMyLetterViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tabView;


@end

@implementation XJMyLetterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addCustomTitleWithTitle:@"我的信件"];
    [self addCustomBackBarButtonItemWithTarget:self action:@selector(backUp)];
}
-(void)backUp{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark  ===tableDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 50;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(!cell){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = @"您的编号为XXX的信件已被预约";
    return cell;
}

@end
