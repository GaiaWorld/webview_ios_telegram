//
//  ImageView.h
//  Telegraph
//
//  Created by Apple on 2018/8/13.
//

#ifndef ImageView_h
#define ImageView_h
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "BaseObject.h"
#import "ImageUtils.h"

@interface ImagePicker: BaseObject

- (void) chooseImage:(NSArray *) array;

@end


#endif /* ImageView_h */
