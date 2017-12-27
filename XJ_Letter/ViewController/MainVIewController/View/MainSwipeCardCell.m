//
//  MainSwipeCardCell.m
//  XJ_Letter
//
//  Created by apple on 2017/11/23.
//  Copyright © 2017年 ZhangJ. All rights reserved.
//

#import "MainSwipeCardCell.h"

@interface MainSwipeCardCell ()
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation MainSwipeCardCell

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        [self setupSubviews];
    }
    return  self;
}

- (void)setupSubviews{
//    self.label = [UILabel new];
//    self.label.numberOfLines = 0;
//    self.userInteractionEnabled = NO;
//    self.label.text = @"实打实大花洒霎时刻的黄金卡仕达好卡萨丁阿萨德和大家说卡号多少按就好撒多撒谎的爱上换手机达到撒娇和手动加号时间的痕迹是谁都会尽快大厦的喀什";
//    [self addSubview:self.label]; 414 414
    

    UIView *view  = [UIView new];
    view.backgroundColor = [UIColor blueColor];
    [self addSubview:view];
    
    self.userInteractionEnabled = NO;
//    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 277, 353)];
//    self.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"home_img"]];
//    [self addSubview:self.imageView];
    
}


- (void)layoutSubviews{
    [super layoutSubviews];
    
//    self.label.frame = self.bounds;
}


@end
