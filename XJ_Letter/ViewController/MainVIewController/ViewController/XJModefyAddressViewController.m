//
//  XJModefyAddressViewController.m
//  XJ_Letter
//
//  Created by 白 浩洋 on 2018/1/7.
//  Copyright © 2018年 ZhangJ. All rights reserved.
//

#import "XJModefyAddressViewController.h"
#import "addressModel.h"
#import <MJExtension.h>
#import <SDAutoLayout.h>
@interface XJModefyAddressViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>

@end

@implementation XJModefyAddressViewController
{
    NSMutableArray *shengArray;
    NSMutableArray *shiArray;
    NSMutableArray *xianArray;
    
    UIPickerView *myPickerView;
    
    NSMutableDictionary *chooseDic;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationBarStyle];
    NSData *JSONData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"area" ofType:@"json"]];
    NSDictionary *dataDic = [NSJSONSerialization JSONObjectWithData:JSONData options:NSJSONReadingAllowFragments error:nil];
    NSMutableArray *dataArray=dataDic[@"result"][0][@"son"];
    shengArray=[NSMutableArray array];
    shiArray=[NSMutableArray array];
    xianArray=[NSMutableArray array];
    chooseDic=[NSMutableDictionary dictionary];
    //省数组
    shengArray=[addressModel mj_objectArrayWithKeyValuesArray:dataArray];
    //市数组，默认省数组第一个
    addressModel *model=shengArray[0];
    shiArray=[addressModel mj_objectArrayWithKeyValuesArray:model.son];
    //县数组，默认市数组第一个
    addressModel *model1=shiArray[0];
    xianArray=[addressModel mj_objectArrayWithKeyValuesArray:model1.son];
    addressModel *model2=xianArray[0];
    [chooseDic setValue:model.area_id forKey:@"sheng"];
    [chooseDic setValue:model.area_id forKey:@"shi"];
    [chooseDic setValue:model2.area_id forKey:@"xian"];
    // 选择框
    myPickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 300)];
    // 显示选中框
    myPickerView.showsSelectionIndicator=YES;
    myPickerView.dataSource = self;
    myPickerView.delegate = self;
    [self.view addSubview:myPickerView];
}
-(void)setNavigationBarStyle{
    [self addCustomTitleWithTitle:@"更换地址"];
    [self addCustomBackBarButtonItemWithTarget:self action:@selector(backUP)];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(0, PXChange(40), PXChange(100), PXChange(44))];
    [button setTitle:@"确定" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithHexString:@"#2d2d2d"] forState:UIControlStateNormal];
    [button addTarget:self  action:@selector(quedingClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *quedingBtnItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = quedingBtnItem;
    self.view.backgroundColor = [UIColor whiteColor];
}
-(void)quedingClick{
    NSLog(@"确定");
    [self backUp];
}
-(void)backUp{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma Mark -- UIPickerViewDataSource
// pickerView 列数
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 3;
}
// pickerView 每列个数
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0) {
        return shengArray.count;
    }
    if (component==1) {
        return  shiArray.count;
    }
    if (component==2) {
        return xianArray.count;
    }
    
    return 0;
}
// 返回选中的行
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSLog(@"选中%ld列---%ld行",(long)component,(long)row);
    if (component==0) {
        addressModel *model=shengArray[row];
        shiArray=[addressModel mj_objectArrayWithKeyValuesArray:model.son];
        [pickerView reloadComponent:1];
        [pickerView selectRow:0 inComponent:1 animated:NO];
        //默认第一个
        addressModel *model1=shiArray[0];
        xianArray=[addressModel mj_objectArrayWithKeyValuesArray:model1.son];
        [pickerView reloadComponent:2];
        [pickerView selectRow:0 inComponent:2 animated:NO];
        addressModel *model2=xianArray[0];
        [chooseDic setValue:model.area_id forKey:@"sheng"];
        [chooseDic setValue:model1.area_id forKey:@"shi"];
        [chooseDic setValue:model2.area_id forKey:@"xian"];
    }
    if (component==1) {
        addressModel *model1=shiArray[row];
        xianArray=[addressModel mj_objectArrayWithKeyValuesArray:model1.son];
        [pickerView reloadComponent:2];
        [pickerView selectRow:0 inComponent:2 animated:NO];
        addressModel *model2=xianArray[0];
        [chooseDic setValue:model1.area_id forKey:@"shi"];
        [chooseDic setValue:model2.area_id forKey:@"xian"];
    }
    if (component==2) {
        addressModel *model2=xianArray[row];
        [chooseDic setValue:model2.area_id forKey:@"xian"];
    }
    NSLog(@"%@",chooseDic);
}
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    UILabel* pickerLabel = (UILabel*)view;
    if (!pickerLabel){
        pickerLabel = [[UILabel alloc] init];
        // Setup label properties - frame, font, colors etc
        //adjustsFontSizeToFitWidth property to YES
        pickerLabel.minimumScaleFactor = 8.;
        pickerLabel.adjustsFontSizeToFitWidth = YES;
        pickerLabel.textColor = [UIColor colorWithHexString:@"#333333"];
        [pickerLabel setTextAlignment:NSTextAlignmentCenter];
        [pickerLabel setBackgroundColor:[UIColor clearColor]];
        [pickerLabel setFont:[UIFont boldSystemFontOfSize:15]];
    }
    // Fill the label text here
    pickerLabel.text=[self pickerView:pickerView titleForRow:row forComponent:component];
    return pickerLabel;
}
//返回当前行的内容,此处是将数组中数值添加到滚动的那个显示栏上
-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component==0) {
        addressModel *model=shengArray[row];
        return model.area_district;
    }
    if (component==1) {
        addressModel *model=shiArray[row];
        return model.area_district;
    }
    if (component==2) {
        addressModel *model=xianArray[row];
        return model.area_district;
    }
    return nil;
}
- (void)backUP{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
