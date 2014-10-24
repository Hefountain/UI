//
//  QFAppDelegate.m
//  UIActionSheet
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
    
    
    [self.window makeKeyAndVisible];
    return YES;
}
//UIActionSheet控件一般用来作为选择提示控件，常用在分享，关机等

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UIActionSheet * actionSheet = [[UIActionSheet alloc] initWithTitle:@"如果写nil，就不显示" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil  otherButtonTitles:@"关机",@"注销",@"重启",@"切换用户", nil];
    
    actionSheet.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
    NSLog(@"总有%d个按钮",actionSheet.numberOfButtons);
    actionSheet.destructiveButtonIndex = 2;
    [actionSheet showInView:self.window];
    
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"ClickButtonAtIndex %@",[actionSheet buttonTitleAtIndex:buttonIndex]);
    if (buttonIndex == 0) {
        NSLog(@"分享到朋友圈");
    } else {
        NSLog(@"分享到微博");
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
