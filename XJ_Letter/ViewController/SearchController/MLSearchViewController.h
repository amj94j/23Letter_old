//
//  MLSearchViewController.h
//  Medicine
//
//  Created by Visoport on 2/1/17.
//  Copyright © 2017年 Visoport. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XJBaseViewController.h"
@interface MLSearchViewController : XJBaseViewController

/** 搜索栏 */
@property (nonatomic, weak) UISearchBar *searchBar;

@property (nonatomic, strong) NSArray *tagsArray;

@end
