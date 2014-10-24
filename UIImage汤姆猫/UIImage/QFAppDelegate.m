//
//  QFAppDelegate.m
//  UIImage
//
//  Created by mac on 14-10-10.
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
    
    //[self useUIImageView_Simple];
    //[self useUIImageView_Tomcat];
    [self useUIView_DockMode];
    return YES;
}


#pragma mark - 图片视图
-(void)useUIImageView_Simple
{
    // UIImageView 继承UIView
    UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 120, 280)];
    
    //initWithImage  类方法   初始化
   // UIImageView *imageview2 = [[UIImageView alloc] initWithImage:@"image:png"];
    
    [self.window addSubview:imageview];
    imageview.backgroundColor = [UIColor blackColor];
    imageview.image = [UIImage imageNamed:@"image.png"];
    
    /*
     内容填充的模式
    UIViewContentModeScaleToFill   	   拉伸内容,会导致内容变形
    UIViewContentModeScaleAspectFit    拉伸内容,内容比例不变
    UIViewContentModeScaleAspectFill   拉伸内容,内容比例不变,但是有可能部分内容不能显示
     */
   //
    imageview.contentMode = UIViewContentModeBottomRight;
    imageview.clipsToBounds = YES;
}

#pragma mark - 动画 汤姆猫
-(void)useUIImageView_Tomcat
{
    UIImageView *imageview = [[UIImageView alloc] initWithFrame:self.window.bounds];
    [self.window addSubview:imageview];
    //填充image内容
    imageview.image = [UIImage imageNamed:@"cat_fart0000.jpg"];
    
    //配置动画参数
    imageview.animationDuration = 2.0;
    imageview.animationRepeatCount = 0;
    
    // 填充动画内容
    NSMutableArray *imgarr = [[NSMutableArray alloc] initWithCapacity:0];
    
    for (int i=0; i<28; i++) {
        NSString *imgname = [NSString stringWithFormat:@"cat_fart%04d.jpg",i];
        UIImage *img = [UIImage imageNamed:imgname];
        [imgarr addObject:img];
    }
    
    imageview.animationImages = imgarr;
    [imageview startAnimating];

}

#pragma mark - 视图  停靠模式

-(void)useUIView_DockMode
{
    
    UIView *superview = [[UIView alloc] initWithFrame:CGRectMake(50, 100, 220, 320)];
    [self.window addSubview:superview];
    superview.backgroundColor = [UIColor blackColor];
    
    UIView *subview = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 120, 80)];
    [superview addSubview:subview];
    subview.backgroundColor = [UIColor blueColor];

    /*实现自动停靠
     先设置父视图的autoresize属性为YES
    再设置子视图的.autoresizingMask
     UIViewAutoresizingFlexibleRightMargin  右边可以伸缩
     UIViewAutoresizingFlexibleLeftMargin
     UIViewAutoresizingFlexibleBottonMargin
     UIViewAutoresizingFlexibleTopMargin
     
     UIViewAutoresizingFlexibleWidth
     UIViewAutoresizingFlexibleHeight
     */
    superview.autoresizesSubviews = YES;
    subview.autoresizingMask =  UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleBottomMargin ;
    
    [UIView animateWithDuration:5.0 animations:^{
        superview.Frame = CGRectMake(50, 100, 320, 220);
    }] ;
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
