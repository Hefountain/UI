//
//  QFAppDelegate.m
//  UIAlertView
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
    
    UIAlertView * alertview = [[UIAlertView alloc] initWithTitle:@"警告" message:@"触发了警告框"  delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:@"OK",nil];
    
    //让警告显示出来，它和普通的view不同，不用加到某个父视图上，而是直接show出来
    //[alertview addButtonWithTitle:@"哈哈"];
    
    NSLog(@"title = %@",alertview.title);
    NSLog(@"message= %@",alertview.message);
    
    NSLog(@"count = %d",alertview.numberOfButtons);
    NSLog(@"cancelindex= %d",alertview.cancelButtonIndex);
    NSLog(@"first = %d",alertview.firstOtherButtonIndex);
    
    
    /*设置警告框的风格
    UIAlertViewStyleDefault = 0,
    UIAlertViewStyleSecureTextInput,  有一个安全输入
    UIAlertViewStylePlainTextInput,    有一个文本输入
    UIAlertViewStyleLoginAndPasswordInput  登录输入
     */
    alertview.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput;
    [alertview show];
    [alertview release];
    
    [self.window makeKeyAndVisible];
   
    return YES;
}

//实现点击警告按钮的方法

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString * buttonTitle = [alertView buttonTitleAtIndex:buttonIndex];
    if ([buttonTitle isEqualToString:@"OK"]) {
        UITextField * login = [alertView textFieldAtIndex:0];
        UITextField * pass = [alertView textFieldAtIndex:1];
        NSLog(@"login = %@",login.text);
        NSLog(@"pass = %@",pass.text);
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
