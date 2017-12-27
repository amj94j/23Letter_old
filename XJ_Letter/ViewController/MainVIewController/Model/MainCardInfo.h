//
//  MainCardInfo.h
//  XJ_Letter
//
//  Created by apple on 2017/11/23.
//  Copyright © 2017年 ZhangJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MainCardInfo : NSObject
@property (nonatomic, assign) long long  feed_id;
@property (nonatomic, copy  ) NSString  *title;
@property (nonatomic, copy  ) NSString  *summary;
@property (nonatomic, copy  ) NSString  *webview_url;
@property (nonatomic, assign) NSInteger fav_count;
@property (nonatomic, assign) BOOL      is_fav;
@end
