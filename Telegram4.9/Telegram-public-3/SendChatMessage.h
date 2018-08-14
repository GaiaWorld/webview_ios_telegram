//
//  SendChatMessage.h
//  Telegraph
//
//  Created by Apple on 2018/8/14.
//

#ifndef SendChatMessage_h
#define SendChatMessage_h

#import <Foundation/Foundation.h>
#import "TGProxyItem.h"
#import "TGProxySignals.h"
#import "BaseObject.h"

@interface SendChatMessage:BaseObject

- (void) setAndroidProxy:(NSArray *)array;

- (void) jumpToTelegram:(NSArray *) array;

@end

#endif /* SendChatMessage_h */
