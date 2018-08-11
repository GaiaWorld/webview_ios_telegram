//
//  WebViewAppDelegate.m
//  telegraph
//
//  Created by yineng on 2018/8/7.
//  Copyright © 2018年 kupay. All rights reserved.
//

#import "WebViewAppDelegate.h"

WebViewAppDelegate *WebViewAppDelegateInstance;

@interface WebViewAppDelegate ()

@property (nonatomic) bool isCurrentWebView;

@end

@implementation WebViewAppDelegate

- (instancetype)init
{
    self = [super init];
    if (self != nil)
    {
        self.isCurrentWebView = YES;
        self.tgDelegate = [[TGAppDelegate alloc] init];
    }
    
    return self;
}

// 切换到Telegram
-(void)changeTelegramView {
    if (self.isCurrentWebView) {
        [TGAppDelegateInstance.window makeKeyAndVisible];
        self.isCurrentWebView = NO;
    } else {
        [self.window makeKeyAndVisible];
        self.isCurrentWebView = YES;
    }
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    WebViewAppDelegateInstance = self;
    
    [self.tgDelegate application:application didFinishLaunchingWithOptions:launchOptions];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.webviewController = [[WebViewController alloc] init];
    
    self.window.rootViewController = self.webviewController;
    
    [self.window makeKeyAndVisible];
    [self.window becomeFirstResponder];
    
    return YES;
}

- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)__unused notificationSettings
{
    if (!self.isCurrentWebView)
        [self.tgDelegate application:application didRegisterUserNotificationSettings:notificationSettings];
}

- (void)application:(UIApplication*)__unused application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    if (!self.isCurrentWebView)
        [self.tgDelegate application:application didRegisterForRemoteNotificationsWithDeviceToken:deviceToken];
}

- (void)application:(UIApplication*)__unused application didFailToRegisterForRemoteNotificationsWithError:(NSError*)error
{
    if (!self.isCurrentWebView)
        [self.tgDelegate application:application didFailToRegisterForRemoteNotificationsWithError:error];
}

- (void)application:(UIApplication *)__unused application didReceiveLocalNotification:(UILocalNotification *)notification
{
    if (!self.isCurrentWebView)
        [self.tgDelegate application:application didReceiveLocalNotification:notification];
}

- (void)application:(UIApplication *)__unused application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    if (!self.isCurrentWebView)
        [self.tgDelegate application:application didReceiveRemoteNotification:userInfo];
}

- (void)application:(UIApplication *)__unused application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler
{
    if (!self.isCurrentWebView)
        [self.tgDelegate application:application didReceiveRemoteNotification:userInfo fetchCompletionHandler:completionHandler];
}

- (void)application:(UIApplication *)__unused application didFailToContinueUserActivityWithType:(NSString *)__unused userActivityType error:(NSError *)__unused error
{
    if (!self.isCurrentWebView)
        [self.tgDelegate application:application didFailToContinueUserActivityWithType:userActivityType error:error];
}

- (void)application:(UIApplication *)__unused application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler
{
    if (!self.isCurrentWebView)
        [self.tgDelegate application:application performActionForShortcutItem:shortcutItem completionHandler:completionHandler];
}

- (void)application:(UIApplication *)__unused application handleActionWithIdentifier:(NSString *)identifier forRemoteNotification:(NSDictionary *)userInfo completionHandler:(void (^)())completionHandler
{
    if (!self.isCurrentWebView)
        [self.tgDelegate application:application handleActionWithIdentifier:identifier forRemoteNotification:userInfo completionHandler:completionHandler];
}

- (void)application:(UIApplication *)__unused application handleActionWithIdentifier:(NSString *)identifier forRemoteNotification:(NSDictionary *)userInfo withResponseInfo:(nonnull NSDictionary *)responseInfo completionHandler:(nonnull void (^)())completionHandler
{
    if (!self.isCurrentWebView)
        [self.tgDelegate application:application handleActionWithIdentifier:identifier forRemoteNotification:userInfo withResponseInfo:responseInfo completionHandler:completionHandler];
}

- (void)application:(UIApplication *)__unused application handleActionWithIdentifier:(NSString *)identifier forLocalNotification:(UILocalNotification *)notification completionHandler:(void (^)())completionHandler
{
    if (!self.isCurrentWebView)
        [self.tgDelegate application:application handleActionWithIdentifier:identifier forLocalNotification:notification completionHandler:completionHandler];
}

- (void)application:(UIApplication *)__unused application handleActionWithIdentifier:(NSString *)identifier forLocalNotification:(UILocalNotification *)notification withResponseInfo:(nonnull NSDictionary *)responseInfo completionHandler:(nonnull void (^)())completionHandler
{
    if (!self.isCurrentWebView)
        [self.tgDelegate application:application handleActionWithIdentifier:identifier forLocalNotification:notification withResponseInfo:responseInfo completionHandler:completionHandler];
}

- (BOOL)application:(UIApplication *)__unused application openURL:(NSURL *)url sourceApplication:(NSString *)__unused sourceApplication annotation:(id)__unused annotation
{
    if (!self.isCurrentWebView)
        return [self.tgDelegate application:application openURL:url sourceApplication:sourceApplication annotation:annotation];
}

- (BOOL)application:(UIApplication *)__unused application openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)__unused options
{
    if (!self.isCurrentWebView)
        return [self.tgDelegate application:application openURL:url options:options];
}

- (BOOL)application:(UIApplication *)__unused application willContinueUserActivityWithType:(NSString *)userActivityType
{
    if (!self.isCurrentWebView)
        return [self.tgDelegate application:application willContinueUserActivityWithType:userActivityType];
}

- (BOOL)application:(UIApplication *)__unused application continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void (^)(NSArray *))__unused restorationHandler
{
    if (!self.isCurrentWebView)
        return [self.tgDelegate application:application continueUserActivity:userActivity restorationHandler:restorationHandler];
}

- (NSUInteger)application:(UIApplication *)__unused application supportedInterfaceOrientationsForWindow:(UIWindow *)__unused window
{
    return [self.tgDelegate application:application supportedInterfaceOrientationsForWindow:window];
}

@end
