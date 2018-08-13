//
//  QRCode.h
//  Telegraph
//
//  Created by Apple on 2018/8/13.
//
#ifndef QRCode_h
#define QRCode_h
#import <Foundation/Foundation.h>
#import "HMScannerController.h"
#import "WebViewController.h"

@interface QRCode: WebViewController

- (void) scan: (NSArray *) array;

+ (void) setVc: (UIViewController *) vc;

@end

#endif /* QRCode_h */
