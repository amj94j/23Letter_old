//
//  XJBaseViewController.m
//  XJ_Letter
//
//  Created by apple on 2017/11/23.
//  Copyright © 2017年 ZhangJ. All rights reserved.
//

#import "XJBaseViewController.h"

@interface XJBaseViewController ()

@end

@implementation XJBaseViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
        self.navigationController.interactivePopGestureRecognizer.delegate = nil;
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addCustomTitleWithTitle:self.title];
//    [self RemoveNavigationBottomLine];
//    self.view.backgroundColor = [UIColor colorWithHexString:@"#f1f4f9"];
    //    self.navigationController.navigationBar.barTintColor = [UIColor colorWithHexString:kColor_MAIN];
    self.navigationController.navigationBar.translucent = NO;
    [self removeNavigationBottonLine];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)removeNavigationBottonLine
{
    //去除uinavogation下边的底线；
    if ([self.navigationController.navigationBar respondsToSelector:@selector( setBackgroundImage:forBarMetrics:)]){
        NSArray *list=self.navigationController.navigationBar.subviews;
        for (id obj in list) {
            if ([obj isKindOfClass:[UIImageView class]]) {
                UIImageView *imageView=(UIImageView *)obj;
                NSArray *list2=imageView.subviews;
                for (id obj2 in list2) {
                    if ([obj2 isKindOfClass:[UIImageView class]]) {
                        UIImageView *imageView2=(UIImageView *)obj2;
                        imageView2.hidden=YES;
                    }
                }
            }
        }
    }
}

// 定制返回
- (void)addCustomBackBarButtonItemWithTarget:(id)target action:(SEL)action
{
    if (!target) {
        target = self;
        action = @selector(cancelAction:);
    }
    self.navigationItem.leftBarButtonItem = [self buttonWithImage:[[UIImage imageNamed:@"regsiter_btn_back_default"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                                 highlightedImage:[[UIImage imageNamed:@"regsiter_btn_back_default"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ]
                                                           target:target
                                                           action:action];
    
}

- (void)cancelAction:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (UIBarButtonItem *)buttonWithImage:(UIImage *)image
                    highlightedImage:(UIImage *)highlightedImage
                              target:(id)target
                              action:(SEL)action {
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    //    [button setFrame:CGRectMake(0, 0, PXChange(44), PXChange(44))];
    [button setImage:image forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

// 定制标题
- (void)addCustomTitleWithTitle:(NSString *)titleName {
    UIFont *font = [UIFont fontWithName:@"Helvetica-Bold" size:17];
    CGSize size = [titleName sizeWithFont:font constrainedToSize:CGSizeMake(ScreenWidth, 44)];
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, size.width, 44)];
    titleLabel.backgroundColor = [UIColor clearColor];
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= 60000
    titleLabel.textAlignment = NSTextAlignmentCenter;
#else
    titleLabel.textAlignment = NSTextAlignmentCenter;
#endif
    
    titleLabel.textColor = [UIColor  colorWithHexString:@"#2d2d2d"];
    titleLabel.shadowOffset = CGSizeMake(0, 1);
    titleLabel.text = titleName;
    [titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:17]];
    [self.navigationItem setTitleView:titleLabel];
}

// 设置导航栏的样式
- (void)setNavigationBarStyle {
    
}
- (void)RemoveNavigationBottomLine{
    //    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithHexString:kColor_MAIN] size:CGSizeMake(ScreenWidth, PXChange(2))] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    //    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}

@end
