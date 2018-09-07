//
//  FingerReader.h
//  Telegraph
//
//  Created by Apple on 2018/8/21.
//

#ifndef FingerReader_h
#define FingerReader_h
#import <Foundation/Foundation.h>
#import <LocalAuthentication/LocalAuthentication.h>
@interface FingerReader:NSObject

- (void) showFingerPrintTouch:(NSArray *)array;

@end

#endif /* FingerReader_h */
