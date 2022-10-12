#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define XLOG(log, ...)	NSLog(@"[VboxNoAd] " log, ##__VA_ARGS__)

%hook DTConfig
- (BOOL)no_ad { return YES; }
- (NSDate *)adDismissedDate { return [NSDate date]; }
- (NSTimeInterval)adNextShowInstervalSec { return 3600 * 24 * 365; }
%end

%ctor {
	XLOG(@"loaded in %s (%d)", getprogname(), getpid());
	%init();
}