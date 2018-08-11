#import <UIKit/UIKit.h>

#import "TGAppDelegate.h"
#import "TGApplication.h"

#import "WebViewAppDelegate.h"

#import "TGDatabase.h"

int main(int argc, char *argv[])
{
    mainLaunchTimestamp = CFAbsoluteTimeGetCurrent();
    applicationStartupTimestamp = mainLaunchTimestamp;
    
    @autoreleasepool
    {
        [TGDatabase setDatabaseName:@"tgdata"];
        
        // return UIApplicationMain(argc, argv, @"TGApplication", @"TGAppDelegate");
        return UIApplicationMain(argc, argv, @"TGApplication", @"WebViewAppDelegate");
    }
}
