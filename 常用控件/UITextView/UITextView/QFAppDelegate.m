//
//  QFAppDelegate.m
//  UITextView
//
//  Created by mac on 14-10-23.
//  Copyright (c) 2014年 fountain. All rights reserved.
//

#import "QFAppDelegate.h"

@implementation QFAppDelegate 
{
    UITextView * textview;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    //创建一个textView
    textview = [[UITextView alloc] initWithFrame:CGRectMake(10, 30, 300, 100)];
    textview.backgroundColor = [UIColor grayColor];
    //默认视图是矩形的，可以调用QuartzCore库里的方法来修改layer层，变成圆角的。
    //允许修改视图
    textview.layer.masksToBounds = YES;
  //设置圆角的弧度
    textview.layer.cornerRadius = 10;
    textview.text = @"默认视图是矩形的，可以调用QuartzCore库里的方法来修改layer层，变成圆角的。允许修改视图默认视图是矩形的，可以调用QuartzCore库里的方法来修改layer层，变成圆角的。允许修改视图默认视图是矩形的，可以调用QuartzCore库里的方法来修改layer层，变成圆角的。允许修改视图图是矩形的，可以调用QuartzCore库里的方法来修改layer层，变成圆角的。允许修改视图默认视图是矩形的，可以调用QuartzCore库里的方法来修改layer层，变成圆角的。允许修改视图";

    //设置是否允许滚动，默认为YES，
    //textview.scrollEnabled = NO;
    
    //设置是否显示滚动条，默认是显示的
   // textview.showsVerticalScrollIndicator = NO;
    
    //设置是否可以编辑，默认是yes
    textview.editable = YES;
    
    //设置代理
    textview.delegate = self;
    
    [self.window addSubview:textview];
    [textview release];
    
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    NSLog(@"将要开始编辑时");
    return YES;
}

- (BOOL)textViewShouldEndEditing:(UITextView *)textView
{
    NSLog(@"将要结束编辑时");
    return YES;
}

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    NSLog(@"正在编辑时");
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    NSLog(@"结束编辑时");
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    NSLog(@"修改替换时");
    return YES;
    
}

- (void)textViewDidChange:(UITextView *)textView
{
    NSLog(@"输入内容时");
}

- (void)textViewDidChangeSelection:(UITextView *)textView
{
    NSLog(@"选择内容时");
}

- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange
{
    return YES;
}

- (BOOL)textView:(UITextView *)textView shouldInteractWithTextAttachment:(NSTextAttachment *)textAttachment inRange:(NSRange)characterRange
{
    return YES;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [textview resignFirstResponder];
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
