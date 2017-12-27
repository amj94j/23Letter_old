//
//  MainBottomToolView.m
//  XJ_Letter
//
//  Created by apple on 2017/11/29.
//  Copyright © 2017年 ZhangJ. All rights reserved.
//

#import "MainBottomToolView.h"


@interface MainBottomToolView ()

@property (nonatomic, strong) UIButton *writeLetterBtn;

@end

@implementation MainBottomToolView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        
        // 防止block中的循环引用
        __weak typeof (self) weakSelf = self;
        
        self.writeLetterBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.writeLetterBtn setImage:[UIImage imageNamed:@"home_edit"] forState:UIControlStateNormal];
        [self.writeLetterBtn addTarget:self action:@selector(editClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.writeLetterBtn];
        
        // 使用mas_makeConstraints添加约束
        [self.writeLetterBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(weakSelf);
            make.top.equalTo(weakSelf).with.offset(PXChange(156));
            make.size.mas_equalTo(CGSizeMake(64, 64));
        }];
        
    }
    
    return self;
}

-(void)editClick{
    NSLog(@"点击了编辑按钮");
}
- (void)drawRect:(CGRect)rect {
    
}

@end
