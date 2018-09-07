//
//  ImageUtils.h
//  Telegraph
//
//  Created by Apple on 2018/8/14.
//

#ifndef ImageUtils_h
#define ImageUtils_h
#import <Foundation/Foundation.h>

@interface ImageUtils:NSObject
//把图片转化为Base64字符串
+ (NSString *) image2base64:(UIImage *)image;
//去掉字符串中的所有换行符
+ (NSString *)removeSpaceAndNewline:(NSString *)str;

@end

#endif /* ImageUtils_h */
