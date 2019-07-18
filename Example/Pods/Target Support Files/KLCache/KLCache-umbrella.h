#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "KLCache.h"
#import "KLDiskCache.h"
#import "KLKVStorage.h"
#import "KLMemoryCache.h"

FOUNDATION_EXPORT double KLCacheVersionNumber;
FOUNDATION_EXPORT const unsigned char KLCacheVersionString[];

