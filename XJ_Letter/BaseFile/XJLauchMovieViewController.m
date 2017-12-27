//
//  XJLauchMovieViewController.m
//  XJ_Letter
//
//  Created by apple on 2017/12/3.
//  Copyright © 2017年 ZhangJ. All rights reserved.
//

#import "XJLauchMovieViewController.h"
#import "AppDelegate.h"
#import "MainViewController.h"
#import "XJBaseNavigationController.h"
#import <AVFoundation/AVFoundation.h>

@implementation XJLauchMovieViewController

- (BOOL)shouldAutorotate {
    return NO;
}
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    // 设置界面
//    [self setupView];
//    //添加监听
//    [self addNotification];
//    //初始化视频
//    [self prepareMovie];
//
//}
//- (void)dealloc {
//    [[NSNotificationCenter defaultCenter] removeObserver:self];
//    [self.timer invalidate];
//    self.timer = nil;
//    self.player = nil;
//
//}
//- (void)viewWillAppear:(BOOL)animated {
//    [super viewWillAppear:animated];
//    //隐藏状态栏
//    [UIApplication sharedApplication].statusBarHidden = NO;
//    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
//}

- (void)setupView {
    
    self.startPlayerImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"lauch"]];
    _startPlayerImageView.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
    [self.contentOverlayView addSubview:_startPlayerImageView];
    [self setupEnterMainButton];
    
}

//设置进入主界面的按钮
- (void)setupEnterMainButton {
    
    self.enterMainButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _enterMainButton.frame = CGRectMake(24, ScreenHeight - 32 - 48, ScreenWidth - 48, 48);
    _enterMainButton.layer.borderWidth = 1;
    _enterMainButton.layer.cornerRadius = 24;
    _enterMainButton.layer.borderColor = [UIColor whiteColor].CGColor;
    [_enterMainButton setTitle:@"进入应用" forState:UIControlStateNormal];
    _enterMainButton.hidden = YES;
    [self.view addSubview:_enterMainButton];
    [_enterMainButton addTarget:self action:@selector(enterMainAction:) forControlEvents:UIControlEventTouchUpInside];
    //设置定时器当视频播放到第三秒时 展示进入应用
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(showEnterMainButton) userInfo:nil repeats:YES];
    
}

// 在这里我们开一个定时器，让按钮在3s之后再显示
// 显示进入按钮（定时器的方法）
- (void)showEnterMainButton {
    AVAssetImageGenerator *gen = [[AVAssetImageGenerator alloc] initWithAsset:self.player.currentItem.asset];
    gen.appliesPreferredTrackTransform = YES;
    NSError *error = nil;
    CMTime actualTime;
    CMTime now = self.player.currentTime;
    [gen setRequestedTimeToleranceAfter:kCMTimeZero];
    [gen setRequestedTimeToleranceBefore:kCMTimeZero];
    [gen copyCGImageAtTime:now actualTime:&actualTime error:&error];
    NSInteger currentPlayBackTime = (NSInteger)CMTimeGetSeconds(actualTime);
    if (currentPlayBackTime >= 3) {
        self.enterMainButton.hidden = NO;
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            self.enterMainButton.alpha = 0;
            [UIView animateWithDuration:0.5 animations:^{
                self.enterMainButton.alpha = 1;
            } completion:nil];
        });
    }
    if (currentPlayBackTime > 5) {
        //防止没有显现出来
        self.enterMainButton.alpha = 1;
        self.enterMainButton.hidden = NO;
        [self.timer invalidate];
        self.timer = nil;
    }
}

//进入应用的按钮点击事件
- (void)enterMainAction:(UIButton *)btn {
    
    //视频暂停
    
    [self.player pause];
    
    self.pausePlayerImageView = [[UIImageView alloc] init];
    
    _pausePlayerImageView.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
    
    [self.contentOverlayView addSubview:_pausePlayerImageView];
    
    self.pausePlayerImageView.contentMode = UIViewContentModeScaleAspectFit;
    
    //获取当前暂停时的截图,也就是设置结束时候的图片
    
    [self getoverPlayerImage];
    
}

//截图的获取方法
- (void)getoverPlayerImage {
    
    AVAssetImageGenerator *gen = [[AVAssetImageGenerator alloc] initWithAsset:self.player.currentItem.asset];
    
    gen.appliesPreferredTrackTransform = YES;
    
    NSError *error = nil;
    
    CMTime actualTime;
    
    CMTime now = self.player.currentTime;
    
    [gen setRequestedTimeToleranceAfter:kCMTimeZero];
    
    [gen setRequestedTimeToleranceBefore:kCMTimeZero];
    
    CGImageRef image = [gen copyCGImageAtTime:now actualTime:&actualTime error:&error];
    
    if (!error) {
        
        UIImage *thumb = [[UIImage alloc] initWithCGImage:image];
        
        self.pausePlayerImageView.image = thumb;
        
    }
    
    NSLog(@"%f , %f",CMTimeGetSeconds(now),CMTimeGetSeconds(actualTime));
    
    NSLog(@"%@",error);
    
    //视频播放结束
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self moviePlaybackComplete];
        
    });
    
}

// 4、在viewDidLoad设置监听，监听视频播放的开始，结束，以及程序进入活动的状态，需要判断是不是第一次进入app，是的话就重复播放视频，不是的话就播放一次

//设置监听

- (void)addNotification {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationDidEnterBackgroundNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(viewWillEnterForeground) name:UIApplicationDidBecomeActiveNotification object:nil];//进入前台
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(moviePlaybackComplete) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];//视频播放结束
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(moviePlaybackStart) name:AVPlayerItemTimeJumpedNotification object:nil];//播放开始
    
}

//实现监听的方法

//开始播放移除我们刚开始加的图片，不然无法看到视频

- (void)moviePlaybackStart {
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self.startPlayerImageView removeFromSuperview];
        
        self.startPlayerImageView = nil;
        
    });
    
}

//视频播放完成移除图片，进入主界面

- (void)moviePlaybackComplete {
    
    //发送推送之后就删除  否则 界面显示有问题
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
     
                                                    name:AVPlayerItemDidPlayToEndTimeNotification
     
                                                  object:nil];
    
    [self.startPlayerImageView removeFromSuperview];
    
    self.startPlayerImageView = nil;
    
    [self.pausePlayerImageView removeFromSuperview];
    
    self.pausePlayerImageView = nil;
    
    if (self.timer){
        [self.timer invalidate];
        self.timer = nil;
    }
    
    //进入主界面
    [self enterMain];
    
}

//app进入活动时播放视频
- (void)viewWillEnterForeground {
    
    NSLog(@"app enter foreground");
    
    if (!self.player) {
        [self prepareMovie];
    }
    
    //播放视频
    [self.player play];
    
}

// 5、在viewDidLoad中初始化视频
- (void)prepareMovie {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"1.mp4" ofType:nil];
    // 初始化player
    self.player = [AVPlayer playerWithURL:[NSURL fileURLWithPath:filePath]];
    self.showsPlaybackControls = NO;
    // 播放视频
    [self.player play];
}

// 6、进入主界面的方法以及判断是否第一次进入app
// 进入主界面
- (void)enterMain {
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    MainViewController *mainViewController = [[MainViewController alloc] init];
    XJBaseNavigationController *naVC = [[XJBaseNavigationController alloc] initWithRootViewController:mainViewController];
    delegate.window.rootViewController = naVC;
    [delegate.window makeKeyWindow];
}

@end
