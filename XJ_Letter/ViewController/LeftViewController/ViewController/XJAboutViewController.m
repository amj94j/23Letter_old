//
//  XJAboutViewController.m
//  XJ_Letter
//
//  Created by 白浩洋 on 2018/1/12.
//  Copyright © 2018年 ZhangJ. All rights reserved.
//

#import "XJAboutViewController.h"

@interface XJAboutViewController ()

@end

@implementation XJAboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addCustomTitleWithTitle:@"关于23号信"];
    [self addCustomBackBarButtonItemWithTarget:self action:@selector(backUp)];
}
-(void)backUp{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
