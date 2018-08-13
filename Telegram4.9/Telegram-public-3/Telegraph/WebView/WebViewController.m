//
//  WebViewController.m
//  Telegraph
//
//  Created by yineng on 2018/8/7.
//  Copyright © 2018年 kupay. All rights reserved.
//

#import "WebViewJSBundle.h"
#import "WebViewController.h"
#import "WebViewAppDelegate.h"
#import "QRCode.h"

WKWebView *webview = nil;

@interface WebViewController () <WKUIDelegate, WKNavigationDelegate, WKScriptMessageHandler>

@end

@implementation WebViewController

+ (WKWebView *)getWebView {
    return webview;
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    webview = [self createWebview];
    [self createButton];
    [QRCode setVc:self];
//    [QRCode setController : webview.context];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreate©∫ƒd.
}

- (WKWebView *)createWebview {
    
    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc]init];
    
    config.preferences = [WKPreferences new];
    
    // 默认为0
    // 设置minimumFontSize后，ios10+的line-height值不对，会导致页面错位
    // config.preferences.minimumFontSize = 45
    
    // 默认认为YES
    config.preferences.javaScriptEnabled = YES;
    // 在iOS上默认为NO，表示不能自动通过窗口打开
    config.preferences.javaScriptCanOpenWindowsAutomatically = NO;
    
    // 创建UserContentController（提供JavaScript向webView发送消息的方法）
    config.userContentController = [[WKUserContentController alloc] init];
    // 添加消息处理，注意：self指代的对象需要遵守WKScriptMessageHandler协议，结束时需要移除
    [config.userContentController addScriptMessageHandler:self name: @"Native"];
    
    WKWebView *webview = [[WKWebView alloc]initWithFrame:self.view.bounds configuration:config];
    
    [webview evaluateJavaScript:@"navigator.userAgent" completionHandler:^(id result, NSError *error) {
        webview.customUserAgent = [result stringByAppendingString:@" YINENG_IOS/1.0"];
    }];
    
    [self.view addSubview:webview];
    
    // NSString *urlPath = @"https://www.baidu.com";
    
    NSString *urlPath = @"http://192.168.33.93:8088/dst/boot/index.html";
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:[NSURL URLWithString:urlPath]];
    [webview loadRequest:request];
    
    //    NSString *basePath = [NSString stringWithFormat:@"%@/android_asset", [[NSBundle mainBundle] bundlePath]];
    //    NSURL *baseUrl = [NSURL fileURLWithPath:basePath isDirectory:YES];
    //    NSString *indexPath = [NSString stringWithFormat:@"%@/index.html", basePath];
    //    NSString *indexContent = [NSString stringWithContentsOfFile:indexPath encoding: NSUTF8StringEncoding error:nil];
    //    [webview loadHTMLString:indexContent baseURL:baseUrl];
    
    // 关闭webView的拖动
    webview.scrollView.scrollEnabled = NO;
    webview.UIDelegate = self;
    webview.navigationDelegate = self;
    
    
    return webview;
}

// HTTPS 加载请求，ios9+有效
- (void)webView:(WKWebView *)webView didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition disposition, NSURLCredential *credential))completionHandler {
    if ([challenge.protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust]) {
        if ([challenge previousFailureCount] == 0) {
            NSURLCredential *credential = [NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust];
            completionHandler(NSURLSessionAuthChallengeUseCredential, credential);
        } else {
            completionHandler(NSURLSessionAuthChallengeCancelAuthenticationChallenge, nil);
        }
    } else {
        completionHandler(NSURLSessionAuthChallengeCancelAuthenticationChallenge, nil);
    }
}

- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler
{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:message message:@"" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        completionHandler();
    }];
    
    [alert addAction:okAction];
    
    [self presentViewController:alert animated:YES completion:nil];
}

// 消息分发
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message
{
    // 判断是否是调用原生的
    if ([message.name isEqualToString:@"Native"]) {
        [WebViewJSBundle sendMessage:message.body];
    } else {
        [WebViewJSBundle callJSError:@"None" funcName:@"None" msg:@"'Not Native Message Call'"];
    }
}

- (void)createButton {
    
    // 绘制形状
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    // 确定宽、高、X、Y坐标
    CGRect frame;
    frame.size.width = 100;
    frame.size.height = 30;
    frame.origin.x = 320 / 2 - 50;
    frame.origin.y = 480 / 2 - 30;
    [btn setFrame:frame];
    
    // 设置Tag(整型)
    btn.tag = 10;
    
    // 设置标题
    [btn setTitle:@"切换telegram" forState:UIControlStateNormal];
    
    // 设置未按下和按下的图片切换
    // [btn setBackgroundImage:[UIImage imageNamed:@"bus.png"] forState:UIControlStateNormal];
    // [btn setBackgroundImage:[UIImage imageNamed:@"plane.png"] forState:UIControlStateHighlighted];
    
    // 设置事件
    [btn addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    // 设置背景色和透明度
    [btn setBackgroundColor:[UIColor blackColor]];
    [btn setAlpha:1.0];
    
    // 或设置背景色和透明度
    btn.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:1.0];
    
    [self.view addSubview:btn];
}

// 按钮响应事件
-(void)btnPressed:(id)sender
{
    UIButton *myBtn = (UIButton *)sender;
    if (myBtn.tag == 10)
    {
        [WebViewAppDelegateInstance changeTelegramView];
    }
}

- (void) openToScan{
    NSString *cardName = @"天涯刀哥 - 傅红雪";
    UIImage *avatar = [UIImage imageNamed:@"avatar"];
    
    HMScannerController *scanner = [HMScannerController scannerWithCardName:cardName avatar:avatar completion:^(NSString *stringValue) {
        
//        self.scanResultLabel.text = stringValue;
    }];
    
    [scanner setTitleColor:[UIColor whiteColor] tintColor:[UIColor greenColor]];
    
    [self showDetailViewController:scanner sender:nil];

}

@end
