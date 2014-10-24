//
//  QFAppDelegate.m
//  UIActivityIndicatorView
//
//  Created by mac on 14-10-23.
//  Copyright (c) 2014年 fountain. All rights reserved.
//

#import "QFAppDelegate.h"

@implementation QFAppDelegate
{
    UIActivityIndicatorView * activity;
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor blackColor];
    //创建一个风火轮，加载等待
    activity = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    NSLog(@"activity = %@",NSStringFromCGRect(activity.frame));
    //设置风火轮的风格
    /*
    UIActivityIndicatorViewStyleWhiteLarge,
    UIActivityIndicatorViewStyleWhite,
    UIActivityIndicatorViewStyleGray,
     */

    activity.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
   //开始转动
    [activity startAnimating];
    //设置停止时是否隐藏,默认是YES，如果NO，影响用户体验
    activity.hidesWhenStopped = YES;
    //设置颜色
    activity.color = [UIColor orangeColor];
    
    UISwitch *sw = [[UISwitch alloc] initWithFrame:CGRectMake(100, 200, 80, 50)];

    [sw setOn:YES animated:YES];
    [sw addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
    
    [self.window addSubview:sw];

    [self.window addSubview:activity];
    
    [activity release];
    [self.window makeKeyAndVisible];
    return YES;
}

-(void)switchAction:(UISwitch *)sw
{
    if (sw.isOn) {
        [activity startAnimating];
         } else {
        [activity stopAnimating];
      }
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
