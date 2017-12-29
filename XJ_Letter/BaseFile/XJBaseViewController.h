//
//  XJBaseViewController.h
//  XJ_Letter
//
//  Created by apple on 2017/11/23.
//  Copyright © 2017年 ZhangJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XJBaseViewController : UIViewController
/**
 *  定制的返回按钮
 *
 *  @param target self
 *  @param action 方法(默认pop)
 */
- (void)addCustomBackBarButtonItemWithTarget:(id)target action:(SEL)action;
/**
 *  定制的返回按钮(白色按钮)
 *
 *  @param target self
 *  @param action 方法(默认pop)
 */
- (void)addCustomWhiteBackBarButtonItemWithTarget:(id)target action:(SEL)action;

/**
 *  定制标题
 *
 *  @param titleName 标题名称
 */
- (void)addCustomTitleWithTitle:(NSString *)titleName;

/**
 *  设置导航栏的标题样式
 */
- (void)setNavigationBarStyle;
@end
