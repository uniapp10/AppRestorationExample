//
//  AppDelegate.m
//  状态恢复
//
//  Created by zhudong on 16/8/28.
//  Copyright © 2016年 zhudong. All rights reserved.
//

#import "AppDelegate.h"
#import "ZDNavigationController.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
//在恢复方法前调用
- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    return YES;
}
//是否启用应用恢复
- (BOOL)application:(UIApplication *)application shouldRestoreApplicationState:(NSCoder *)coder{
    return YES;
}
//应用恢复,在该代理方法中创建只声明了重用标识,未声明重用类型的对象
- (UIViewController *)application:(UIApplication *)application viewControllerWithRestorationIdentifierPath:(NSArray *)identifierComponents coder:(NSCoder *)coder{
    

    //identifierComponents的最后一个元素就是其恢复标识
    UIViewController *vc = [[ViewController alloc] init];
    ZDNavigationController *nav = [[ZDNavigationController alloc] initWithRootViewController:vc];
    nav.restorationIdentifier = [identifierComponents firstObject];
    self.window.rootViewController = nav;
    if ([identifierComponents count] > 1) {
        for (int i = 0; i < identifierComponents.count; i++) {
            Class vc = NSClassFromString([identifierComponents lastObject]);
            ViewController *vc1 = [[vc alloc] init];
            [nav pushViewController:vc1 animated:true];
        }
    }
    return nav;
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    if (!self.window.rootViewController) {
        ViewController *vc = [[ViewController alloc] init];
        vc.view.backgroundColor = [UIColor greenColor];
        vc.restorationIdentifier = NSStringFromClass([ViewController class]);
        ZDNavigationController *nav = [[ZDNavigationController alloc] initWithRootViewController:vc];
        //设置恢复标识
        nav.restorationIdentifier = NSStringFromClass([ZDNavigationController class]);
        self.window.rootViewController = nav;
    }
    [self.window makeKeyAndVisible];
    return YES;
}
//是否启用状态保存
- (BOOL)application:(UIApplication *)application shouldSaveApplicationState:(NSCoder *)coder{
    return YES;
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
