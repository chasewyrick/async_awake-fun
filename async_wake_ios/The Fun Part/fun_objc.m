//
//  fun_objc.m
//  async_wake_ios
//
//  Created by George on 16/12/17.
//  Copyright © 2017 Ian Beer. All rights reserved.
//

#include <dlfcn.h>
#include <copyfile.h>
#include <stdio.h>
#include <spawn.h>
#include <unistd.h>
#include <mach/mach.h>
#include <mach-o/dyld.h>
#include <sys/stat.h>
#include <sys/mount.h>
#include <sys/utsname.h>
#import <Foundation/Foundation.h>

// TODO: Clean code up

const NSString* execPath() {
    char path[4096];
    uint32_t size = sizeof(path);
    _NSGetExecutablePath(path, &size);
    char *pt = realpath(path, NULL);
    return [[NSString stringWithUTF8String:pt] stringByDeletingLastPathComponent];
}

const char* path(NSString* binary) {
    NSString *bootstrap = [execPath() stringByAppendingPathComponent:binary];
    return [bootstrap UTF8String];
}

const char* tarPath() { return path(@"tar"); }
const char* bootstrapPath() { return path(@"bootstrap.tar"); }
const char* launchctlPath() { return path(@"launchctl"); }
const char* reloadPath() { return path(@"reload"); }
const char* reloadPlist() { return path(@"0.reload.plist"); }
const char* dropbearPlist() { return path(@"dropbear.plist"); }

const char* realPath() {
	char path[4096];
	uint32_t size = sizeof(path);
	_NSGetExecutablePath(path, &size);
	char *pt = realpath(path, NULL);
	return pt;
}
