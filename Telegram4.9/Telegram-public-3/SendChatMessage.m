//
//  SendChatMessage.m
//  Telegraph
//
//  Created by Apple on 2018/8/14.
//
#import "WebViewAppDelegate.h"
#import "SendChatMessage.h"
@implementation SendChatMessage

- (void) setIOSProxy:(NSArray *) array{
    NSNumber *callbackId = [array objectAtIndex:0];
    NSString *proxtIp=[array objectAtIndex:1];
    int port = [[array objectAtIndex:2] intValue];
    NSString *userName = [array objectAtIndex:3];
    NSString *pwd = [array objectAtIndex:4];
    NSString *secret = [array objectAtIndex:5];
    TGProxyItem *proxy = [[TGProxyItem alloc] initWithServer:proxtIp port:port username:userName password:pwd secret:secret];
    [TGProxySignals applyProxy:proxy inactive:false];
   [WebViewJSBundle callJS:callbackId code:0 params:[NSArray arrayWithObjects:@"代理设置成功",nil]];
}

- (void) jumpToTelegram:(NSArray *) array{
    [[WebViewAppDelegate getWebViewAppDelegate] changeTelegramView];
}

@end
