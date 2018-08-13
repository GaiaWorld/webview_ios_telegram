//
//  QRCode.m
//  Telegraph
//
//  Created by Apple on 2018/8/13.
//

#import "QRCode.h"
UIViewController *controller=nil;
@implementation QRCode
+ (void) setVc: (UIViewController *) vc{
    controller=vc;
}
- (void) scan:(NSArray *) array{
    NSNumber *listenerId=[array objectAtIndex:0];
    NSString *cardName = @"";
    UIImage *avatar = [UIImage imageNamed:@""];

    // 实例化扫描控制器
    HMScannerController *scanner = [HMScannerController scannerWithCardName:cardName avatar:avatar completion:^(NSString *stringValue) {
        [WebViewJSBundle callJS:listenerId code:0 params:[NSArray arrayWithObjects:stringValue, nil]];
    }];
    [scanner setTitleColor:[UIColor whiteColor] tintColor:[UIColor greenColor]];
    [controller showDetailViewController:scanner sender:nil];
}

@end


