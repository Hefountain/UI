//
//  QFAppDelegate.m
//  UISwitch
//
//  Created by mac on 14-10-23.
//  Copyright (c) 2014年 fountain. All rights reserved.
//

#import "QFAppDelegate.h"

@implementation QFAppDelegate
{
    UIImageView * imgview;
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
     imgview = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 90, 70)];
   // 如果动画不设置image属性的话，那么动画在停止时什么也不显示
    imgview.image = [UIImage imageNamed:@"01.JPG"];
    //用来装动画图片
    NSMutableArray * array = [[NSMutableArray alloc] init];
    
    for (int i=1; i<=8; i++) {
        NSString * string = [NSString stringWithFormat:@"%.2d.JPG",i];
        UIImage *image = [UIImage imageNamed:string];
        [array addObject:image];
    }
    
    //将数组加到动画里面去
    imgview.animationImages = array;
    imgview.animationDuration = 0.5;
    imgview.animationRepeatCount = 0;
    [imgview startAnimating];
    [self.window addSubview:imgview];
    [imgview release];
    
    //创建一个开关对象,它的大小是固定的，51  *   31
    UISwitch * sw = [[UISwitch alloc] initWithFrame:CGRectMake(100, 300, 300, 300)];
   //将一个CGRect类型的数据转换为字符串
    NSLog(@"sw.frame =%@ ",NSStringFromCGRect(sw.frame));    //    sw.frame ={{100, 300}, {51, 31}}
    
    [sw addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
    [self.window addSubview:sw];
   // sw.on = YES;
    [sw setOn:YES animated:YES];
    [sw release];
    
    [self.window makeKeyAndVisible];
    return YES;
}

-(void)switchAction:(UISwitch *)sw
{
    if (sw.isOn) {
        [imgview startAnimating];
        [sw setOn:YES animated:YES];
    } else {
        [imgview stopAnimating];
        [sw setOn:NO];
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
