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

#import "QDNavigationControllerDelegate.h"
#import "QDNavigationImageManager.h"
#import "UINavigationController+QDNavigationBarHidden.h"
#import "UIViewController+QDNavigationBarHidden.h"

FOUNDATION_EXPORT double QDNavigationBarHiddenHelperVersionNumber;
FOUNDATION_EXPORT const unsigned char QDNavigationBarHiddenHelperVersionString[];

