//
//  Test.m
//  test
//
//  Created by yineng on 2018/8/9.
//  Copyright © 2018年 kupay. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "WebViewTest.h"
#import "../WebViewJSBundle.h"

@implementation Test

- (void)testInstance:(NSArray *)array {
    NSLog(@"test : %@", array);
    
    NSNumber *listenerID = [array objectAtIndex:0];
    
    NSNumber *a = [array objectAtIndex:1];
    NSNumber *b = [array objectAtIndex:2];
    NSNumber *c = [array objectAtIndex:3];
    NSNumber *d = [array objectAtIndex:4];
    NSString *s = [array objectAtIndex:5];
    [WebViewJSBundle callJS:listenerID code:0 params:[NSArray arrayWithObjects:a, b, c, d, s, nil]];
}

+ (void)testStatic:(NSArray *)array {
    NSLog(@"testStatic : %@", array);
    
    NSNumber *listenerID = [array objectAtIndex:0];
    
    NSNumber *a = [array objectAtIndex:1];
    NSNumber *b = [array objectAtIndex:2];
    NSNumber *c = [array objectAtIndex:3];
    NSNumber *d = [array objectAtIndex:4];
    NSString *s = [array objectAtIndex:5];
    [WebViewJSBundle callJS:listenerID code:0 params:[NSArray arrayWithObjects:a, b, c, d, s, nil]];}

@end

