//
//  UINavigationController+QDNavigationBarHidden.m
//  Pods-QDNavigationBarHiddenHelper_Example
//
//  Created by Sinno on 2019/3/26.
//

#import "UINavigationController+QDNavigationBarHidden.h"
#import "UIViewController+QDNavigationBarHidden.h"
#import "QDNavigationControllerDelegate.h"
#import <objc/runtime.h>

@implementation UINavigationController (QDNavigationBarHidden)
+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        {
            SEL originalSelector = @selector(setNavigationBarHidden:animated:);
            SEL swizzledSelector = @selector(qd_setNavigationBarHidden:animated:);
            [self swapOriginalSelector:originalSelector swizzledSelector:swizzledSelector class:class];
        }
        {   // 交换setDelegate方法
            SEL originalSelector = @selector(setDelegate:);
            SEL swizzledSelector = @selector(qd_setDelegate:);
            [self swapOriginalSelector:originalSelector swizzledSelector:swizzledSelector class:class];
        }
        
    });
}

+(void)swapOriginalSelector:(SEL)originalSelector swizzledSelector:(SEL)swizzledSelector class:(Class)class{
    
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    BOOL success = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    if (success) {
        class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

-(void)qd_setNavigationBarHidden:(BOOL)hidden animated:(BOOL)animate{
    [self qd_setNavigationBarHidden:hidden animated:animate];
    self.topViewController.qd_navigationBarHidden = hidden;
}


- (void)setQd_navigationBarHiddenHelperEnabled:(BOOL)enabled {
    if (self.qd_navigationBarHiddenHelperEnabled == enabled) {
        return;
    }
    // 关闭
    if (!enabled) {
        if (self.delegate == self.qd_navigationControllerDelegate) {
            self.delegate = self.qd_navigationControllerDelegate.navRealDelegate;
        }
    } else {
        // 打开
        if (!self.delegate) { // 没有设置代理
            self.delegate = self.qd_navigationControllerDelegate;
        } else if (self.delegate != self.qd_navigationControllerDelegate) {
            id realDelegate = self.delegate;
            self.delegate = self.qd_navigationControllerDelegate;
            self.qd_navigationControllerDelegate.navRealDelegate = realDelegate;
        }
    }
    objc_setAssociatedObject(self, @selector(qd_navigationBarHiddenHelperEnabled), @(enabled), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)qd_navigationBarHiddenHelperEnabled {
    NSNumber *enabled = objc_getAssociatedObject(self, _cmd);
    if (!enabled) {
        return NO;
    } else {
        return [enabled boolValue];
    }
}

-(void)qd_setDelegate:(id<UINavigationControllerDelegate>)delegate{
    if ([delegate isKindOfClass:QDNavigationControllerDelegate.class]) {
        [self qd_setDelegate:delegate];
    }else{
        [self qd_navigationControllerDelegate].navRealDelegate = delegate;
    }
    
}



- (QDNavigationControllerDelegate *)qd_navigationControllerDelegate
{
    QDNavigationControllerDelegate *delegate = objc_getAssociatedObject(self, _cmd);
    
    if (!delegate) {
        delegate = [[QDNavigationControllerDelegate alloc] init];
        delegate.navigationController = self;
        
        objc_setAssociatedObject(self, _cmd, delegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return delegate;
}

@end
