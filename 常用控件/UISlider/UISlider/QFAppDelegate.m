//
//  QFAppDelegate.m
//  UISlider
//
//  Created by mac on 14-10-23.
//  Copyright (c) 2014年 fountain. All rights reserved.
//

#import "QFAppDelegate.h"

@implementation QFAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    //创建一个滑块，宽有效而已
    UISlider *sd = [[UISlider alloc] initWithFrame:CGRectMake(0, 100, 320, 50)];
    
    //设置较小值的轨道颜色
    sd.minimumTrackTintColor = [UIColor orangeColor];
    
    // 设置较大值的轨道颜色
    sd.maximumTrackTintColor = [UIColor brownColor];
    
    //设置滑块的颜色 ,无效
   // sd.thumbTintColor = [UIColor redColor];
    
    //设置滑块的图片，正常状态下
    [sd setThumbImage:[UIImage imageNamed:@"03.JPG"] forState:0];
    // 高亮状态下，也就是按下时
    [sd setThumbImage:[UIImage imageNamed:@"05.JPG"] forState:UIControlStateHighlighted];
    //设置滑块的区间最大 最小值
    sd.minimumValue = 0;
    sd.maximumValue = 100;
    
    [sd addTarget:self action:@selector(sliderAction:) forControlEvents:UIControlEventValueChanged];
    
    [self.window addSubview:sd];
    [sd release];
    
    [self.window makeKeyAndVisible];
    return YES;
}

-(void)sliderAction:(UISlider *)slider
{
    NSLog(@"slider = %.2f",slider.value);
    if (slider.value == 100) {
        [slider setThumbImage:[UIImage imageNamed:@"08.JPG"] forState:0];
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
