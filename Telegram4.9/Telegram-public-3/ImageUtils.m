//
//  ImageUtils.m
//  Telegraph
//
//  Created by Apple on 2018/8/14.
//

#import "ImageUtils.h"
@implementation ImageUtils

+ (NSString *) image2base64:(UIImage *)image{
    NSData *data = UIImageJPEGRepresentation(image, 1.0f);
    NSString *encodedImageStr = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    return [self removeSpaceAndNewline:encodedImageStr];
}

+ (NSString *)removeSpaceAndNewline:(NSString *)str{
    NSString *temp = [str stringByReplacingOccurrencesOfString:@" " withString:@""];
    temp = [temp stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    temp = [temp stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    return temp;
}

@end
