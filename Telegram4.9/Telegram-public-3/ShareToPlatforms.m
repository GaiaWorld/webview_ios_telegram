//
//  ShareToPlatforms.m
//  Telegraph
//
//  Created by Apple on 2018/8/13.
//

#import "ShareToPlatforms.h"
#import <ShareSDK/ShareSDK.h>
#import <ShareSDKUI/ShareSDK+SSUI.h>
#import "WebViewJSBundle.h"
const static int PLATFORM_ALL = -1;//分享的平台 所有 注：当传递这个参数的时候、会直接调用原生的分享菜单
const static int PLATFORM_WE_CHAT = 1;//分享的平台 微信好友
const static int PLATFORM_MOMENTS = 2;//分享的平台 朋友圈
const static int PLATFORM_Q_ZONE = 3;//分享的平台 QQ空间
const static int PLATFORM_QQ = 4;//分享的平台 QQ
const static int PLATFORM_LINE = 5;//分享的平台 LINE
const static int SHARE_TYPE_IAMGE = 1;//分享的类型图片
const static int SHARE_TYPE_TEXT = 2;//分享的类型文本
@implementation ShareToPlatforms

- (void) shareLink: (NSArray *) array{
    NSNumber *callbackId=[array objectAtIndex:0];
    NSString *webName=[array objectAtIndex:1];
    NSString *url=[array objectAtIndex:2];
    NSString *title=[array objectAtIndex:3];
    NSString *content=[array objectAtIndex:4];
    NSString *comment=[array objectAtIndex:5];
    NSNumber *platform=[array objectAtIndex:6];
    NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
    [shareParams SSDKSetupShareParamsByText:content
                                     images:@"http://s6.sinaimg.cn/middle/7b2edf37ga00e00fe41a5&690"
                                        url:[NSURL URLWithString:url]
                                      title:title
                                       type:SSDKContentTypeAuto];
    //有的平台要客户端分享需要加此方法，例如微博
    [shareParams SSDKEnableUseClientShare];
    //2、分享（可以弹出我们的分享菜单和编辑界面）
    [ShareSDK showShareActionSheet:nil //要显示菜单的视图, iPad版中此参数作为弹出菜单的参照视图，只有传这个才可以弹出我们的分享菜单，可以传分享的按钮对象或者自己创建小的view 对象，iPhone可以传nil不会影响
                             items:nil
                       shareParams:shareParams
               onShareStateChanged:^(SSDKResponseState state, SSDKPlatformType platformType, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error, BOOL end) {
                   switch (state) {
                       case SSDKResponseStateSuccess:{
                           [WebViewJSBundle callJS:callbackId code:0 params:[NSArray arrayWithObjects:@"success",nil]];
                           break;
                       }
                       case SSDKResponseStateFail:{
                           [WebViewJSBundle callJS:callbackId code:1 params:[NSArray arrayWithObjects:@"failed",nil]];
                           break;
                       }
                       default:
                           break;
                   }
               }
     ];}

- (void) getSharePlatform:(int) value{
    
}

- (void) shareContent: (NSArray *) array{
    
}

@end
