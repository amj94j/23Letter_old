//
//  XJLauchMovieViewController.h
//  XJ_Letter
//
//  Created by apple on 2017/12/3.
//  Copyright © 2017年 ZhangJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVKit/AVKit.h>

@interface XJLauchMovieViewController : AVPlayerViewController

/** 播放开始之前的图片 */

@property (nonatomic , strong)UIImageView *startPlayerImageView;

/** 播放中断时的图片 */

@property (nonatomic , strong)UIImageView *pausePlayerImageView;

/** 定时器 */

@property (nonatomic , strong)NSTimer *timer;

/** 结束按钮 */

@property (nonatomic , strong)UIButton *enterMainButton;

@end
