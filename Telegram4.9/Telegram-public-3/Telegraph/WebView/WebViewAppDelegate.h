//
//  WebViewAppDelegate.m
//  Telegraph
//
//  Created by yineng on 2018/8/7.
//  Copyright © 2018年 kupay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ShareSDK/ShareSDK.h>
#import <ShareSDKConnector/ShareSDKConnector.h>
//腾讯开放平台（对应QQ和QQ空间）SDK头文件
#import <TencentOpenAPI/TencentOAuth.h>
#import <TencentOpenAPI/QQApiInterface.h>
//微信SDK头文件
#import "WXApi.h"
#import "WebViewController.h"
#import "../TGAppDelegate.h"

@class WebViewAppDelegate;
extern WebViewAppDelegate *WebViewAppDelegateInstance;


@interface WebViewAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) TGAppDelegate *tgDelegate;

@property (strong, nonatomic) WebViewController *webviewController;
@property (strong, nonatomic) TGNavigationController *navController;

// 切换到Telegram
-(void)changeTelegramView;

+ (WebViewAppDelegate *) getWebViewAppDelegate;

@end


