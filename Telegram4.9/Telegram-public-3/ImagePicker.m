//
//  ImageView.m
//  Telegraph
//
//  Created by Apple on 2018/8/13.
//


#import "ImagePicker.h"
#import "TZImagePickerController.h"

@implementation ImagePicker

- (void) chooseImage:(NSArray *) array{
    NSNumber *callbackId=[array objectAtIndex:0];//回调的Id
    NSNumber *userCamera=[array objectAtIndex:1];//是否启用相机
    NSNumber *single=[array objectAtIndex:2];//是否为单选(只能选择一张)
    NSNumber *max=[array objectAtIndex:3];//最大可选择的张数(当single为1时、此参数无效！)
    NSNumber *number_1 = [NSNumber numberWithInt:1];
    int maxCount=1;
    if (![single isEqualToNumber:number_1]) {
        maxCount=[max intValue];
    }
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:maxCount delegate:self];
    
    // You can get the photos by block, the same as by delegate.
    // 你可以通过block或者代理，来得到用户选择的照片.
    //    imagePickerVc.delegate=self;
    //    [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets){}];
    [[BaseObject getVc] presentViewController:imagePickerVc animated:YES completion:nil];
}

@end
