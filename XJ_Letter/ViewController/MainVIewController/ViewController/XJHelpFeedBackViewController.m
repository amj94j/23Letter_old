//
//  XJHelpFeedBackViewController.m
//  XJ_Letter
//
//  Created by 白浩洋 on 2018/1/9.
//  Copyright © 2018年 ZhangJ. All rights reserved.
//

#import "XJHelpFeedBackViewController.h"
#import "PlaceholderTextView.h"

#define kTextBorderColor     RGBCOLOR(227,224,216)

#undef  RGBCOLOR
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
@interface XJHelpFeedBackViewController ()<UITextViewDelegate>

@property (nonatomic, strong) PlaceholderTextView * textView;

@property (nonatomic, strong) UIButton * sendButton;
@end

@implementation XJHelpFeedBackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addCustomTitleWithTitle:@"帮助与反馈"];
    [self addCustomBackBarButtonItemWithTarget:self action:@selector(backUp)];
    [self setUpUI];
}
-(void)setUpUI{
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.textView];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.sendButton];
}
-(void)backUp{
    [self.navigationController popViewControllerAnimated:YES];
}
-(PlaceholderTextView *)textView{
    if (!_textView) {
        _textView = [[PlaceholderTextView alloc]initWithFrame:CGRectMake(PXChange(24), PXChange(40), self.view.frame.size.width - PXChange(48), PXChange(400))];
        _textView.backgroundColor = [UIColor colorWithHexString:@"#f7f7f7"];
        _textView.delegate = self;
        _textView.font = [UIFont systemFontOfSize:14.f];
        _textView.textColor = [UIColor blackColor];
        _textView.textAlignment = NSTextAlignmentLeft;
        _textView.editable = YES;
        _textView.layer.cornerRadius = 10.0f; 
        _textView.layer.borderColor = [UIColor colorWithHexString:@"#c0c0c0"].CGColor;
        _textView.layer.borderWidth = PXChange(1);
        _textView.placeholderColor = [UIColor colorWithHexString:@"#c0c0c0"];
        _textView.placeholder = @"请输入您的反馈意见...";
    }
    
    return _textView;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    
    if ([@"\n" isEqualToString:text] == YES)
    {
        [textView resignFirstResponder];
        
        
        return NO;
    }
    
    return YES;
}

- (UIButton *)sendButton{
    
    if (!_sendButton) {
        _sendButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _sendButton.layer.cornerRadius = 7.0f;
        _sendButton.frame = CGRectMake(PXChange(24), CGRectGetMaxY(self.textView.frame)+PXChange(41), self.view.frame.size.width - PXChange(48), PXChange(80));
        _sendButton.backgroundColor = [UIColor colorWithHexString:@"#808954"];
        [_sendButton setTitle:@"提交" forState:UIControlStateNormal];
        [_sendButton addTarget:self action:@selector(sendFeedBack) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sendButton;
    
}
- (void)sendFeedBack{
    [self backUp];
}


- (UIColor *)colorWithRGBHex:(UInt32)hex
{
    int r = (hex >> 16) & 0xFF;
    int g = (hex >> 8) & 0xFF;
    int b = (hex) & 0xFF;
    
    return [UIColor colorWithRed:r / 255.0f
                           green:g / 255.0f
                            blue:b / 255.0f
                           alpha:1.0f];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
