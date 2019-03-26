//
//  UIViewController+QDNavigationBarHidden.m
//  Pods-QDNavigationBarHiddenHelper_Example
//
//  Created by Sinno on 2019/3/26.
//

#import "UIViewController+QDNavigationBarHidden.h"
#import <objc/runtime.h>
@implementation UIViewController (QDNavigationBarHidden)

-(BOOL)qd_navigationBarHidden{
    NSNumber* number = objc_getAssociatedObject(self, _cmd);
    if (!number) {
        return NO;
    }else{
        return number.boolValue;
    }
}

-(void)setQd_navigationBarHidden:(BOOL)hidden{
    objc_setAssociatedObject(self, @selector(qd_navigationBarHidden), @(hidden), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@end
