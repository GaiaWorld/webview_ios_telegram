//
//  FingerReader.m
//  Telegraph
//
//  Created by Apple on 2018/8/21.
//

#include "FingerReader.h"

@implementation FingerReader

- (void) showFingerPrintTouch:(NSArray *)array{
    //系统支持，最低iOS 8.0
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0)
    {
        LAContext * context = [[LAContext alloc] init];
        NSError * error;
        if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error])
        {
            
            //localizedReason: 指纹识别出现时的提示文字
            [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:@"指纹解锁" reply:^(BOOL success, NSError * _Nullable error) {
                
                if (success)
                {
                    //识别成功
                    dispatch_async(dispatch_get_main_queue(), ^{
                        //在主线程中，处理 ......
                    });
                }
                else if (error)
                {
                    NSLog(@"LAPolicyDeviceOwnerAuthenticationWithBiometrics -- %@",error);
                }
                
            }];
            
        }
        else if([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthentication error:nil])
        {
            [context evaluatePolicy:LAPolicyDeviceOwnerAuthentication localizedReason:@"密码解锁" reply:^(BOOL success, NSError * _Nullable error){
                
                NSLog(@"LAPolicyDeviceOwnerAuthentication -- %@", error);
                
            }];
        }
        NSLog(@" --- %@ ", error);
    }
}

@end

