//
//  AppDelegate.h
//  XJ_Letter
//
//  Created by apple on 2017/11/22.
//  Copyright © 2017年 ZhangJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

