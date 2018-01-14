//
//  MainViewController.m
//  XJ_Letter
//
//  Created by apple on 2017/11/23.
//  Copyright © 2017年 ZhangJ. All rights reserved.
//

#import "MainViewController.h"
#import "LZSwipeableView.h"
#import "MainCardInfo.h"
#import "MainSwipeCardCell.h"
#import "MainBottomToolView.h"
#import "QQDrawerViewController.h"
#import "XJGuanZhuViewController.h"
#import "XJFansViewController.h"
#import "XJMyLetterViewController.h"
#import "XJMyWalletViewController.h"
#import "XJSettingViewController.h"
#import "MLSearchViewController.h"
#define kColorBackground_Main  [UIColor colorWithHexString:@"#f7f7f7"]

@interface MainViewController () <LZSwipeableViewDataSource,
LZSwipeableViewDelegate>

@property (nonatomic, strong) NSMutableArray *cardInfoList;
@property (nonatomic, strong) LZSwipeableView *swipeableView;

@end

@implementation MainViewController

- (NSMutableArray *)cardInfoList {
    if (!_cardInfoList) {
        _cardInfoList = [NSMutableArray array];
    }
    return _cardInfoList;
}

- (LZSwipeableView *)swipeableView {
    if (!_swipeableView) {
        _swipeableView = [[LZSwipeableView alloc] initWithFrame:self.view.frame];
        _swipeableView.datasource = self;
        _swipeableView.delegate = self;
        _swipeableView.backgroundColor = kColorBackground_Main;
        _swipeableView.containerView.backgroundColor = kColorBackground_Main;
        // (30, 49, 0, 49);
        _swipeableView.topCardInset = UIEdgeInsetsMake(30, 49, 0, 49);
        _swipeableView.size = CGSizeMake(PXChange(556), PXChange(758));
        _swipeableView.hidden = YES;
    }
    return _swipeableView;
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //    self.tabBarController.tabBar.hidden =YES;
    //    self.view.frame =CGRectMake(0,64,ScreenWidth,ScreenHeight+64);
    //    [self m_customTabBarHidden];
    [UITabBar appearance].clipsToBounds = YES;
    [UINavigationBar appearance].clipsToBounds = YES;
    [[UITabBar appearance] setBackgroundColor:[UIColor whiteColor]];
    [[UITabBar appearance] setBarTintColor:[UIColor whiteColor]];
    //    [[UITabBar appearance] setTintColor:ButtonColor];
    [[UITabBar appearance] setBackgroundImage:[UIImage imageNamed:@"tabbarImage.png"]];
    // [UITabBar appearance].clipsToBounds = YES; // 添加的图片大小不匹配的话，加上此句，屏蔽掉tabbar多余部分
    [[UITabBar appearance] setShadowImage:[UIImage imageNamed:@"tabbarImage.png"]];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addCustomTitleWithTitle:@"23号信"];
    [self makeNavigationBar];
    [self configNotifation];
    //
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.swipeableView];
    self.swipeableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.swipeableView registerClass:[MainSwipeCardCell class] forCellReuseIdentifier:NSStringFromClass([MainSwipeCardCell class])];
    
    self.swipeableView.bottomCardInsetHorizontalMargin = PXChange(20);
    self.swipeableView.bottomCardInsetVerticalMargin = PXChange(20);
    
    for (int i = 0; i < 100; i++) {
        MainCardInfo *info = [[MainCardInfo alloc] init];
        info.feed_id = 123145;
        info.title = [NSString stringWithFormat:@"测试%zd",i];
        info.summary = [NSString stringWithFormat:@"测试desc%zd",i];
        info.fav_count = arc4random_uniform(100);
        info.is_fav = arc4random_uniform(1);
        [self.cardInfoList addObject:info];
    }
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5* NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.swipeableView.hidden = NO;
        [self.swipeableView reloadData];
    });
}
-(void)makeNavigationBar{
    self.navigationController.navigationBar.translucent = NO;
    self.tabBarController.tabBar.clipsToBounds = YES;//隐藏tabbar
    //更改tabbar 背景颜色
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 49)];
    backView.backgroundColor = kColorBackground_Main;
    [self.tabBarController.tabBar insertSubview:backView atIndex:0];
    self.tabBarController.tabBar.opaque = YES;
    //左侧
    UIButton *leftBarbtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, PXChange(88), PXChange(88))];
    [leftBarbtn setImage:[UIImage imageNamed:@"navbar_classifty"] forState:UIControlStateNormal];
    [leftBarbtn addTarget:self action:@selector(leftBarClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftBar = [[UIBarButtonItem alloc]initWithCustomView:leftBarbtn];
    self.navigationItem.leftBarButtonItem = leftBar;
    //右侧
    UIButton *rightBarbtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, PXChange(88), PXChange(88))];
    [rightBarbtn setImage:[UIImage imageNamed:@"navbar_postition"] forState:UIControlStateNormal];
    [rightBarbtn addTarget:self action:@selector(rightBarClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightBar = [[UIBarButtonItem alloc]initWithCustomView:rightBarbtn];
    self.navigationItem.rightBarButtonItem = rightBar;
}

-(void)configNotifation{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(guanzhuClick) name:GuanzhuClick object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(fansClick) name:FansClick object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(searchClick) name:SearchClick object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(messageClick) name:MessageClick object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(walletClick) name:WalletClick object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(myletterClick) name:MyletterClick object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(myCollectionClick) name:MyCollectionClick object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(settingClick) name:SettingClick object:nil];
}
//抽屉菜单点击事件
-(void)leftBarClick{
    [[QQDrawerViewController shareDrawerViewController] openDrawerWithOpenDuration:0.2];
}
-(void)rightBarClick{
    NSLog(@"点击了右侧按钮");
}
//搜索
-(void)searchClick{
    MLSearchViewController *vc = [[MLSearchViewController alloc] init];
    vc.tagsArray = @[@"青春故事", @"回忆杀", @"风停雨万霖天下", @"郭敬明", @"值得买", @"周杰伦", @"林俊杰"];
//    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
//    [self presentViewController:nav  animated:YES completion:nil];
    [self.navigationController pushViewController:vc animated:NO];
}
//消息
-(void)messageClick{
    
}
//钱包
-(void)walletClick{
    XJMyWalletViewController *MWV = [[XJMyWalletViewController alloc]init];
    MWV.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:MWV animated:NO];
    
}
//我的信件
-(void)myletterClick{
    XJMyLetterViewController *XJC = [[XJMyLetterViewController alloc]init];
    XJC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:XJC animated:NO];
}
//我的收藏
-(void)myCollectionClick{
    
}
// 设置
-(void)settingClick{
    XJSettingViewController *xjc = [[XJSettingViewController alloc]init];
    xjc.hidesBottomBarWhenPushed = YES;
     [self.navigationController pushViewController:xjc animated:NO];
}
-(void)guanzhuClick{
    XJGuanZhuViewController *guanzhuVC = [XJGuanZhuViewController new];
    guanzhuVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:guanzhuVC animated:NO];
}
-(void)fansClick{
    XJFansViewController *fansVC = [XJFansViewController new];
    fansVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:fansVC animated:NO];
}
- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    self.swipeableView.frame = self.view.bounds;
}

#pragma mark LZSwipeableViewDataSource
- (NSInteger)swipeableViewNumberOfRowsInSection:(LZSwipeableView *)swipeableView{
    return self.cardInfoList.count;
}

- (LZSwipeableViewCell *)swipeableView:(LZSwipeableView *)swipeableView cellForIndex:(NSInteger)index {
    MainSwipeCardCell *cell = [swipeableView dequeueReusableCellWithIdentifier:NSStringFromClass([MainSwipeCardCell class])];
    cell.cardInfo = self.cardInfoList[index];
    
    cell.layer.contents = (id)[UIImage imageNamed:@"home_img"].CGImage;
    
    return cell;
}

//- (LZSwipeableViewCell *)swipeableView:(LZSwipeableView *)swipeableView substituteCellForIndex:(NSInteger)index{
//    MainSwipeCardCell *cell = [[MainSwipeCardCell alloc] initWithReuseIdentifier:@""];
//    cell.cardInfo = self.cardInfoList[index];
//    cell.backgroundColor = [UIColor orangeColor];
//    return cell;
//}

#pragma mark LZSwipeableViewDelegate
- (NSInteger)swipeableViewMaxCardNumberWillShow:(LZSwipeableView *)swipeableView{
    return 4;
}
- (void)swipeableView:(LZSwipeableView *)swipeableView didTapCellAtIndex:(NSInteger)index{
    
}

- (UIView *)footerViewForSwipeableView:(LZSwipeableView *)swipeableView{
    return [self showFooterView];
}

- (UIView *)showFooterView {
    MainBottomToolView *bottomView = [[MainBottomToolView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-self.swipeableView.height)];
    bottomView.backgroundColor = kColorBackground_Main;
//        bottomView.superVCtl = self;
//        bottomView.delegate  = self;
    return bottomView;
}

- (CGFloat)heightForFooterView:(LZSwipeableView *)swipeableView{
    return PXChange(350);
}

- (UIView *)headerViewForSwipeableView:(LZSwipeableView *)swipeableView{
//    return [self showHeaderView];
    return nil;
}

- (UIView *)showHeaderView {
    return [UIView new];
}


- (CGFloat)heightForHeaderView:(LZSwipeableView *)swipeableView{
    return PXChange(40);
}

// 拉到最后一个
//- (void)swipeableViewDidLastCardRemoved:(LZSwipeableView *)swipeableView{
//
//}
//
//
//- (void)swipeableView:(LZSwipeableView *)swipeableView didCardRemovedAtIndex:(NSInteger)index withDirection:(LZSwipeableViewCellSwipeDirection)direction{
//    NSLog(@"%zd",direction);
//}
//
//
//- (void)swipeableView:(LZSwipeableView *)swipeableView didTopCardShow:(LZSwipeableViewCell *)topCell{
//
//}
//
//
//- (void)swipeableView:(LZSwipeableView *)swipeableView didLastCardShow:(LZSwipeableViewCell *)cell{
//
//}

#pragma mark - AVKnackBottomToolViewDelegate
- (void)knackBottomToolViewDidCheckDetailBtnClick:(MainCardInfo *)idInfo{
    [self.swipeableView removeTopCardViewFromSwipe:LZSwipeableViewCellSwipeDirectionLeft];
}


- (void)knackBottomToolViewDidCollectBtnClick:(MainCardInfo *)idInfo{
    [self.swipeableView removeTopCardViewFromSwipe:LZSwipeableViewCellSwipeDirectionRight];
}

- (void)knackBottomToolViewDidShareBtnClick:(MainCardInfo *)idInfo{
    [self.swipeableView removeTopCardViewFromSwipe:LZSwipeableViewCellSwipeDirectionBottom];
    //    }else{
    //        [self.swipeableView removeTopCardViewFromSwipe:LZSwipeableViewCellSwipeDirectionTop];
    //    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
