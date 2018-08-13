//
//  WebViewController.h
//  Telegraph
//
//  Created by yineng on 2018/8/7.
//  Copyright © 2018年 kupay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

@interface WebViewController : UIViewController

+ (WKWebView *)getWebView;

+ (void) openToScan;

@end

