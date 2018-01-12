//
//  QQLeftTableViewController.m
//  QQDRAWER_OC
//
//  Created by zzy on 2016/10/27.
//  Copyright © 2016年 BlackSky. All rights reserved.
//

#import "QQLeftTableViewController.h"
#import "QQDrawerViewController.h"
#import "FSMediaPicker.h"

@interface QQLeftTableViewController ()<UITableViewDelegate,UITableViewDataSource,FSMediaPickerDelegate>
@property (nonatomic, strong)UIView *headerView;
@property (nonatomic, strong)NSMutableArray *dataArray;
@property (nonatomic, strong)NSMutableArray *imgDataArr;
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)UIImageView *iconImage;
@property (nonatomic, strong)UILabel *nameLabel;
@property (nonatomic, strong)UILabel *addressLabel;
@property (nonatomic, strong)UILabel *guanzhuLabel;
@property (nonatomic, strong)UILabel *fansLabel;
@property (nonatomic, strong)UIButton *guanzhuBtn;
@property (nonatomic, strong)UIButton *fansBtn;
@property (nonatomic, strong)UIButton *iconBtn;
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
    [self.iconImage sd_setImageWithURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1514353699309&di=b0aa36bc4adc53d233b351a2c35a9c00&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimgad%2Fpic%2Fitem%2Fb58f8c5494eef01fe3d59cf9ebfe9925bd317dcd.jpg"]];  //在此配置 icon 头像
    self.nameLabel.text = @"草莓上的芝麻"; //在此配置用户名
    self.addressLabel.text =@"北京市丰台区"; //在此配置收货地址
    self.guanzhuLabel.text = @"66"; //在此配置关注
    self.fansLabel.text = @"66"; //在此配置粉丝
    
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
    switch (indexPath.row) {
        case 0:{
            [self searchClick];
        }
            break;
        case 1:{
            [self messageClick];
        }
            break;
        case 2:{
            [self walletClick];
        }
            break;
        case 3:{
            [self myletterClick];
        }
            break;
        case 4:{
            [self myCollectionClick];
        }
            break;
        case 5:{
            [self settingClick];
        }
            break;
        default:
            break;
    }
    [self turnBackToMainViewConttoller];
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
    [[QQDrawerViewController shareDrawerViewController] closeDrawerWithOpenDuration:0.2];
}

#pragma mark - 懒加载
-(UIView *)headerView{
    if (!_headerView) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, leftDrawerWidth, PXChange(600))];
        _headerView.backgroundColor = [UIColor clearColor];
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, PXChange(600)-PXChange(1), ScreenWidth, PXChange(1))];
        label.backgroundColor = [UIColor colorWithHexString:@"#efefef"];
        [_headerView addSubview:label];
        
        self.iconImage= [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, PXChange(200), PXChange(200))];
        [self.iconImage sd_setImageWithURL:[NSURL URLWithString:@"http://o97zrcc31.bkt.clouddn.com/bhy100.jpg"]];
        self.iconImage.clipsToBounds = YES;
        self.iconImage.layer.cornerRadius =  self.iconImage.width/2.0f;
        self.iconImage.center = CGPointMake(_headerView.width/2.0f,self.iconImage.height/2.0f+PXChange(100));
        [_headerView addSubview:self.iconImage];
        
        self.iconBtn = [[UIButton alloc]initWithFrame:self.iconImage.frame];
        [self.iconBtn addTarget:self action:@selector(iconClick) forControlEvents:UIControlEventTouchUpInside];
        [_headerView addSubview:self.iconBtn];
        
        self.nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, leftDrawerWidth, PXChange(33))];
        self.nameLabel.text = @"会飞的企鹅";
        self.nameLabel.textColor = [UIColor colorWithHexString:@"#333333"];
        self.nameLabel.textAlignment = NSTextAlignmentCenter;
        self.nameLabel.font = [UIFont systemFontOfSize:PXChange(32)];
        self.nameLabel.center =CGPointMake(self.iconImage.centerX, self.iconImage.bottom+PXChange(34)+self.nameLabel.height/2.0f);
        [_headerView addSubview:self.nameLabel];
        
        self.addressLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, leftDrawerWidth, PXChange(33))];
        self.addressLabel.text = @"默认收货地址:哈尔滨-南岗区";
        self.addressLabel.textColor = [UIColor colorWithHexString:@"#333333"];
        self.addressLabel.textAlignment = NSTextAlignmentCenter;
        self.addressLabel.font = [UIFont systemFontOfSize:PXChange(32)];
        self.addressLabel.center =CGPointMake(self.iconImage.centerX, self.nameLabel.bottom+PXChange(34)+self.addressLabel.height/2.0f);
        [_headerView addSubview:self.addressLabel];
        
        UILabel *lineLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, PXChange(1), PXChange(80))];
        lineLabel.backgroundColor = [UIColor colorWithHexString:@"#efefef"];
        lineLabel.center = CGPointMake(self.iconImage.centerX, self.addressLabel.bottom+PXChange(60));
        [_headerView addSubview:lineLabel];
        
        self.guanzhuLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, leftDrawerWidth/2.0f-PXChange(42), PXChange(44))];
        self.guanzhuLabel.text = @"10086";
        self.guanzhuLabel.textColor = [UIColor colorWithHexString:@"#333333"];
        self.guanzhuLabel.textAlignment = NSTextAlignmentRight;
        self.guanzhuLabel.font = [UIFont systemFontOfSize:PXChange(40)];
        self.guanzhuLabel.center =CGPointMake(self.iconImage.centerX-PXChange(42)-self.guanzhuLabel.width/2.0f,self.addressLabel.bottom+PXChange(64));
        [_headerView addSubview:self.guanzhuLabel];
        
        UILabel *gLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
        gLabel.textColor = [UIColor colorWithHexString:@"333333"];
        gLabel.text = @"关注";
        gLabel.font = [UIFont systemFontOfSize:PXChange(28)];
        [gLabel sizeToFit];
        gLabel.centerY = self.guanzhuLabel.bottom+PXChange(4)+gLabel.width/2.0f;
        gLabel.right = self.guanzhuLabel.right;
        [_headerView addSubview:gLabel];
        
        self.fansLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, leftDrawerWidth/2.0f-PXChange(42), PXChange(44))];
        self.fansLabel.text = @"500";
        self.fansLabel.textColor = [UIColor colorWithHexString:@"#333333"];
        self.fansLabel.textAlignment = NSTextAlignmentLeft;
        self.fansLabel.font = [UIFont systemFontOfSize:PXChange(40)];
        self.fansLabel.center =CGPointMake(self.iconImage.centerX+PXChange(42)+self.fansLabel.width/2.0f, self.addressLabel.bottom+PXChange(64));
        [_headerView addSubview:self.fansLabel];
        
        UILabel *flabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
        flabel.textColor = [UIColor colorWithHexString:@"333333"];
        flabel.text = @"粉丝";
        flabel.font = [UIFont systemFontOfSize:PXChange(28)];
        [flabel sizeToFit];
        flabel.centerY = self.fansLabel.bottom+PXChange(4)+gLabel.width/2.0f;
        flabel.left = self.fansLabel.left;
        [_headerView addSubview:flabel];
        
        self.guanzhuBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, PXChange(150), PXChange(100))];
        [self.guanzhuBtn addTarget:self action:@selector(guanzhuClick) forControlEvents:UIControlEventTouchUpInside];
        self.guanzhuBtn.center  = CGPointMake(leftDrawerWidth/2.0f-PXChange(42)-self.guanzhuBtn.width/2.0f, self.addressLabel.bottom+PXChange(70));
        [_headerView addSubview:self.guanzhuBtn];
        
        self.fansBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, PXChange(150), PXChange(100))];
        [self.fansBtn addTarget:self action:@selector(fansClick) forControlEvents:UIControlEventTouchUpInside];
        self.fansBtn.center  = CGPointMake(leftDrawerWidth/2.0f+PXChange(42)+self.guanzhuBtn.width/2.0f, self.addressLabel.bottom+PXChange(70));
        [_headerView addSubview:self.fansBtn];
        
    }
    return _headerView;
}
- (void)iconClick{
    FSMediaPicker *mediaPicker = [[FSMediaPicker alloc] init];
    mediaPicker.mediaType = FSMediaTypePhoto;
    mediaPicker.editMode = FSEditModeCircular;
    mediaPicker.delegate = self;
    [mediaPicker showFromView:self.view];
}
//关注
-(void)guanzhuClick{
    [[QQDrawerViewController shareDrawerViewController] closeDrawerWithOpenDuration:0.0];
    [[NSNotificationCenter defaultCenter] postNotificationName:GuanzhuClick object:nil];
}
//粉丝
-(void)fansClick{
    [[QQDrawerViewController shareDrawerViewController] closeDrawerWithOpenDuration:0.0];
    [[NSNotificationCenter defaultCenter] postNotificationName:FansClick object:nil];
}
//搜索
-(void)searchClick{
    [[QQDrawerViewController shareDrawerViewController] closeDrawerWithOpenDuration:0.0];
    [[NSNotificationCenter defaultCenter] postNotificationName:SearchClick object:nil];
}
//消息
-(void)messageClick{
    [[QQDrawerViewController shareDrawerViewController] closeDrawerWithOpenDuration:0.0];
    [[NSNotificationCenter defaultCenter] postNotificationName:MessageClick object:nil];
}
//钱包
-(void)walletClick{
    [[QQDrawerViewController shareDrawerViewController] closeDrawerWithOpenDuration:0.0];
    [[NSNotificationCenter defaultCenter] postNotificationName:WalletClick object:nil];
}
//我的信件
-(void)myletterClick{
    [[QQDrawerViewController shareDrawerViewController] closeDrawerWithOpenDuration:0.0];
    [[NSNotificationCenter defaultCenter] postNotificationName:MyletterClick object:nil];
}
//我的收藏
-(void)myCollectionClick{
    [[QQDrawerViewController shareDrawerViewController] closeDrawerWithOpenDuration:0.0];
    [[NSNotificationCenter defaultCenter] postNotificationName:MyCollectionClick object:nil];
}
// 设置
-(void)settingClick{
    [[QQDrawerViewController shareDrawerViewController] closeDrawerWithOpenDuration:0.0];
    [[NSNotificationCenter defaultCenter] postNotificationName:SettingClick object:nil];
}
- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray arrayWithObjects:@"搜索",@"消息",@"钱包",@"我的信件",@"我的收藏",@"设置", nil];
    }
    return _dataArray;
}
- (NSMutableArray *)imgDataArr{
    if (!_imgDataArr) {
        _imgDataArr = [NSMutableArray arrayWithObjects:@"my_original-image",@"my_email",@"my_wallet",@"my_email",@"favorite",@"my_set", nil];
    }
    return _imgDataArr;
}
#pragma mark - FSMediaPicker delegate
- (void)mediaPicker:(FSMediaPicker *)mediaPicker didFinishWithMediaInfo:(NSDictionary *)mediaInfo
{
    if(mediaInfo.mediaType == FSMediaTypePhoto)
    {
        self.iconImage.image = mediaInfo.editedImage;
//        self.localImage = mediaPicker.editMode == FSEditModeCircular? mediaInfo.circularEditedImage:mediaInfo.editedImage;
//        [self reloadTableData];
//        [self savePressed:nil];
    }
}


// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}




@end
