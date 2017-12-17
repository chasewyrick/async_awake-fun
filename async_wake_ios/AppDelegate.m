#import "AppDelegate.h"
#include "async_wake.h"
#include "fun.h"

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <dlfcn.h>
#import <CoreFoundation/CoreFoundation.h>

extern int MISValidateSignatureAndCopyInfo (CFStringRef File, CFDictionaryRef Opts, NSDictionary *Info);
extern CFStringRef MISCopyErrorStringForErrorCode(int Error);

typedef int (*t)(CFStringRef f, CFDictionaryRef o, NSDictionary**	I);
typedef CFStringRef (*w)(int e);

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
	mach_port_t user_client;
	mach_port_t tfp0 = get_tfp0(&user_client);
	
	let_the_fun_begin(tfp0, user_client);
	
	NSLog(@" ♫ KPP never bothered me anyway... ♫ ");
	
	// the app seems to remain even after stopped by xcode - we'll just force it to quit 
	kill(getpid(), SIGKILL);
	
    return YES;
}

@end
