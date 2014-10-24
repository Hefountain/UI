//
//  QFAppDelegate.m
//  UIProgressView
//
//  Created by mac on 14-10-23.
//  Copyright (c) 2014年 fountain. All rights reserved.
//

#import "QFAppDelegate.h"

@implementation QFAppDelegate
{
    UIProgressView * progressview;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    //创建一个进度条，frame设置高时，无效，默认为2
    progressview= [[UIProgressView alloc] initWithFrame:CGRectMake(0, 100, 320, 30)];
    NSLog(@"%@",NSStringFromCGRect(progressview.frame));  //   {{0, 100}, {320, 2}}
    
    // 设置进度值，但是一般来说，这个值不去写，而只是用来读值，这个属性的写值操作在控制模块里
    progressview.progress = 0.5;
    //设置进度颜色
    progressview.progressTintColor = [UIColor redColor];
    //设置背景颜色
    progressview.backgroundColor = [UIColor orangeColor];
    
    // 设置风格，只有将风格设置为UIProgressViewStyleBar，那么上面的背景颜色设置才有效。
    progressview.progressViewStyle = UIProgressViewStyleBar;
    
    UISlider * slider = [[UISlider alloc ]initWithFrame:CGRectMake(0, 200, 320, 2)];
    slider.minimumValue = 0;
    slider.maximumValue = 300;
    [slider addTarget:self action:@selector(sliderAction:) forControlEvents:UIControlEventValueChanged];
    
    [self.window addSubview:slider];
    [slider release];
    
    [self.window addSubview:progressview];
    [progressview release];
    [self.window makeKeyAndVisible];
    return YES;
}


-(void)sliderAction:(UISlider *)slider
{
    // 使用滑块的值去改变进度条的值，要注意进行换算，因为它们的长度不一致
    progressview.progress = slider.value/300;
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
