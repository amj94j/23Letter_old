//
//  QQLeftTableViewController.m
//  QQDRAWER_OC
//
//  Created by zzy on 2016/10/27.
//  Copyright © 2016年 BlackSky. All rights reserved.
//

#import "QQLeftTableViewController.h"
#import "QQDrawerViewController.h"

@interface QQLeftTableViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UIView *headerView;
@property (nonatomic, strong)NSMutableArray *dataArray;
@property (nonatomic, strong)NSMutableArray *imgDataArr;
@property (nonatomic, strong)UITableView *tableView;
@end

@implementation QQLeftTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.headerView];
    [self configHeadView];
    CGSize size = [UIScreen mainScreen].bounds.size;
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, PXChange(600), size.width, size.height - PXChange(600)) style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"sigle.jpg"]];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.scrollEnabled = NO;
    
}
-(void)configHeadView{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; 
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        cell.backgroundColor = [UIColor clearColor];
        cell.textLabel.textColor = [UIColor colorWithHexString:@"#333333"];
        cell.textLabel.font = [UIFont systemFontOfSize:PXChange(34)];
    }
    
    cell.textLabel.text = self.dataArray[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:self.imgDataArr[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    LeftTurnViewController *rootViewController = [[LeftTurnViewController alloc]init];
//    rootViewController.navigationItem.title = self.dataArray[indexPath.row];
//    rootViewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(turnBackToMainViewConttoller)];
//    UINavigationController *navViewController = [[UINavigationController alloc]initWithRootViewController:rootViewController];
//    
//    [[QQDrawerViewController shareDrawerViewController] switchViewController:navViewController];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 1;
}


/**
 选中cell后的跳转
 */
- (void)turnBackToMainViewConttoller{
    [[QQDrawerViewController shareDrawerViewController] swithToMainViewController];
}

#pragma mark - 懒加载
-(UIView *)headerView{
    if (!_headerView) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, PXChange(600))];
        _headerView.backgroundColor = [UIColor clearColor];
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, PXChange(600)-PXChange(1), ScreenWidth, PXChange(1))];
        label.backgroundColor = [UIColor colorWithHexString:@"#efefef"];
        [_headerView addSubview:label];
    }
    return _headerView;
}

- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray arrayWithObjects:@"搜索",@"消息",@"钱包",@"我的信件",@"设置", nil];
    }
    return _dataArray;
}
- (NSMutableArray *)imgDataArr{
    if (!_imgDataArr) {
        _imgDataArr = [NSMutableArray arrayWithObjects:@"my_original-image",@"my_email",@"my_wallet",@"my_email",@"my_set", nil];
    }
    return _imgDataArr;
}
/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}




@end
