//
//  AppDelegate.m
//  XJ_Letter
//
//  Created by apple on 2017/11/22.
//  Copyright © 2017年 ZhangJ. All rights reserved.
//  lalalalallala

#import "AppDelegate.h"
#import "MainViewController.h"
#import "XJBaseNavigationController.h"
#import "XJLauchMovieViewController.h"
#import "QQLeftTableViewController.h"
#import "QQMainTabBarController.h"
#import "QQDrawerViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;//把状态栏的颜色设置为白色
    UIWindow *window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    window.backgroundColor = [UIColor whiteColor];
    
//    XJLauchMovieViewController *vc = [[XJLauchMovieViewController alloc] init];
//    window.rootViewController = vc;
    self.window = window;
    
    [self.window makeKeyAndVisible];
    
    // 预先请求网络以及网络请求的相关设置
    [self initAttributes];
    [[UINavigationBar appearance] setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
//    MainViewController *mainViewController = [[MainViewController alloc] init];
//    XJBaseNavigationController *naVC = [[XJBaseNavigationController alloc] initWithRootViewController:mainViewController];
//    self.window.rootViewController = naVC;
    QQLeftTableViewController *leftViewController = [[QQLeftTableViewController alloc]init];
    //  创建主视图
    QQMainTabBarController *mainViewController = [[QQMainTabBarController alloc]init];
    //  传入左视图和主视图以及抽屉的最大宽度 创建抽屉
    QQDrawerViewController *rootViewController = [QQDrawerViewController drawerWithLeftViewController:leftViewController andMainViewController:mainViewController andMaxWidth:leftDrawerWidth];
    self.window.rootViewController = rootViewController;
    //    [self.window makeKeyAndVisible];
    
    
    NSLog(@"---白白白白白--0000000--");
    return YES;
}

#pragma mark -
#pragma mark - 网络初始设置 & 网络预加载的数据
- (void)initAttributes {
    // 网络配置
    [HYBNetworking updateBaseUrl:kRealmNameForAppStore];
    [HYBNetworking configRequestType:kHYBRequestTypePlainText responseType:kHYBResponseTypeJSON shouldAutoEncodeUrl:NO callbackOnCancelRequest:YES];
    
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}


#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"XJ_Letter"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                    */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

@end
