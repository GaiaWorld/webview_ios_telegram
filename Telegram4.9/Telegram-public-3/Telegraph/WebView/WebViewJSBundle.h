//
//  JSBundle.h
//  test
//
//  Created by yineng on 2018/8/9.
//  Copyright © 2018年 kupay. All rights reserved.
//

#import <UIKit/UIKit.h>

//MARK: callJS的状态
typedef enum {
    Success  = 0,
    Fail = 1,
    Callback = 100
} CallJSType;

@interface WebViewJSBundle: NSObject

+ (void)callJS:(id)identity code:(CallJSType)code params:(NSArray *)params;

+ (void)callJSError:(NSString *)arrayClassName funcName:(NSString *)funcName msg:(NSString *)msg;

+ (void)sendMessage:(NSArray *)params;

@end
