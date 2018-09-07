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
#import "WebViewJSBundle.h"
#import "BaseObject.h"

@interface QRCode: BaseObject

- (void) scan: (NSArray *) array;

@end

#endif /* QRCode_h */
