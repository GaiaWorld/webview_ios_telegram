//
//  ShareToPlatforms.h
//  Telegraph
//
//  Created by Apple on 2018/8/13.
//

#ifndef ShareToPlatforms_h
#define ShareToPlatforms_h
#import <Foundation/Foundation.h>
#import "BaseObject.h"
@interface ShareToPlatforms: BaseObject

- (void) shareLink: (NSArray *) array;
- (void) shareContent: (NSArray *) array;

@end

#endif /* ShareToPlatforms_h */
