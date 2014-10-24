//
//  QFAppDelegate.m
//  UIWebView
//
//  Created by mac on 14-10-23.
//  Copyright (c) 2014年 fountain. All rights reserved.
//

#import "QFAppDelegate.h"

@implementation QFAppDelegate
{
    UIWebView * webview;
    UITextField *ee;
    NSURLRequest * request;
    UIActivityIndicatorView * activity;
    UIButton * _goBackButton;
    UIButton * _goForwardButton;

}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    webview = [[UIWebView alloc] initWithFrame:CGRectMake(0, 50, 320, 430)];

    UIImageView *imgview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    imgview.image = [UIImage imageNamed:@"10_0.jpg"];
    [self.window addSubview:imgview];
    [imgview release];
    
    _goBackButton = [UIButton buttonWithType:UIButtonTypeSystem];
    _goBackButton.frame = CGRectMake(0, 22, 30, 25);
    [_goBackButton setTitle:@"⬅️" forState:UIControlStateNormal];
    _goBackButton.tag = 100;
  //  [_goBackButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.window addSubview:_goBackButton];
    
    _goForwardButton = [UIButton buttonWithType:UIButtonTypeSystem];
    _goForwardButton.frame = CGRectMake(25,22, 30, 25);
    _goForwardButton .tag = 101;
    [_goForwardButton setTitle:@"➡️" forState:UIControlStateNormal];
    //[_goForwardButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.window addSubview:_goForwardButton];

    
    //创建一个文本框，用来输入网址
    ee = [[UITextField alloc] initWithFrame:CGRectMake(55, 20, 250, 28)];
    ee.backgroundColor = [UIColor colorWithRed:121/255.0 green:188/255.0 blue:218/255.0 alpha:0.8];
    ee.layer.cornerRadius = 10;
    ee.delegate = self;

    [self.window addSubview:ee];
    [ee release];
    
    //webview.backgroundColor = [UIColor purpleColor];  无效
    // webview.tintColor = [UIColor yellowColor];  亦无效
    [self.window makeKeyAndVisible];
    return YES;
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //创建活动卡
    UIActionSheet * actionSheet = [[UIActionSheet alloc]initWithTitle:@"我分享,我快乐" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"分享到千锋",@"分享到微博",@"分享到微信",@"分享到人人网",nil];
    //设置活动卡的风格为黑色半透明
    actionSheet.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
    // 将活动卡添加到window上
    [actionSheet showInView:self.window];
    [actionSheet release];
    
}

//当点击活动卡上的按钮时
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
            ee.text = @"http://10.0.8.8";
    } else if(buttonIndex==1){
            ee.text = @"http://www.weibo.com";
    }
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    //创建一个UIWebView
    [ee resignFirstResponder];

    
    activity = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(100, 300, 60, 60)];
    activity.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
    activity.hidesWhenStopped = YES;
    activity.color = [UIColor yellowColor];

    NSLog(@"将要开始加载数据");
    
    return  YES;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
//    textField.text = ee.text;
    NSLog(@"%@",textField.text);
   // [textField resignFirstResponder];
    
    //将输入文本框的字符串赋给网址字符串
    NSString  *urlString = textField.text;
    // 将网址字符串转化为URL对象
    NSURL *url = [NSURL URLWithString:urlString];
    //利用url对象，来创建一个网络请求
    request = [[NSURLRequest alloc] initWithURL:url];
    //设置webview的代理
    webview.delegate = self;
    //加载请求
    [webview loadRequest:request];
    [self.window addSubview:webview];
    [webview release];
    return YES;
}


- (void)webViewDidStartLoad:(UIWebView *)webView
{
    NSLog(@"开始加载数据");
    [self.window addSubview:activity];
    //创建风火轮
    [activity startAnimating];
    [activity release];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSLog(@"完成加载数据");
    [activity stopAnimating];
    
//      //将输入文本框的字符串赋给网址字符串
//    NSString  *urlString = ee.text;
//    
//    // 将网址字符串转化为URL对象
//    NSURL *url = [NSURL URLWithString:urlString];
//    //利用url对象，来创建一个网络请求
//    request = [[NSURLRequest alloc] initWithURL:url];
//    //设置webview的代理
//    webview.delegate = self;
//    //加载请求
//    [webview loadRequest:request];
   // [webview release];

}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"加载数据出错时");
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
