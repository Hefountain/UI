//
//  QFAppDelegate.m
//  UIStepper
//
//  Created by mac on 14-10-23.
//  Copyright (c) 2014年 fountain. All rights reserved.
//

#import "QFAppDelegate.h"

@implementation QFAppDelegate
{
    UILabel * label;
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 120, 60)];
    label.text = @"0";
    label.font = [UIFont systemFontOfSize:18];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor purpleColor];
    [self.window addSubview:label];
    [label release];
    
    //创建一个步进器，frame的size同样设置无效，默认为94 * 29
    UIStepper * step = [[UIStepper alloc] initWithFrame:CGRectMake(100, 50, 50, 50)];
    NSLog(@"step.value=%@",NSStringFromCGRect(step.frame));
    
    //默认的区间值为0 ---- 100，步进值为1
    step.minimumValue = 100;
    step.maximumValue = 1000;
    step.stepValue = 100;
    
    //设置是否是实时显示步进后的值，默认为YES
    step.continuous = NO;
    //长按是否生效，默认NO，不管按多久，都只步进一次
    step.autorepeat = YES;
    //设置到极值的时候，是否循环
    step.wraps = YES;
    
    [step addTarget:self action:@selector(stepAction:) forControlEvents:UIControlEventValueChanged];
    [self.window addSubview:step];
    [step release];
    
    [self.window makeKeyAndVisible];
    return YES;
}


-(void)stepAction:(UIStepper *)step
{
    NSLog(@"step.value = %.2f",step.value);
    label.text = [NSString stringWithFormat:@"%.1f",step.value];
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
