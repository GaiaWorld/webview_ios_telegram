//
//  QRCodeUtil.h
//  Telegraph
//
//  Created by Apple on 2018/8/14.
//

#ifndef QRCodeUtil_h
#define QRCodeUtil_h
#import <Foundation/Foundation.h>
@interface QRCodeUtil
//根据文本内容生成二维码的图片
+ (UIImage *) createQRCodeByText:(NSString *)txt;
@end

#endif /* QRCodeUtil_h */
