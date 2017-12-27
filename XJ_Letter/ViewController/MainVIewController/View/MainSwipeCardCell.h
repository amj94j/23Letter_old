//
//  MainSwipeCardCell.h
//  XJ_Letter
//
//  Created by apple on 2017/11/23.
//  Copyright © 2017年 ZhangJ. All rights reserved.
//

#import "LZSwipeableView.h"
#import "MainCardInfo.h"
@interface MainSwipeCardCell : LZSwipeableViewCell
/** 卡片信息  */
@property (nonatomic, strong) MainCardInfo *cardInfo;
@end
