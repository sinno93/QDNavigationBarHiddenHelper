//
//  QDNavigationControllerDelegate.m
//  QDNavigationControllerDemo
//
//  Created by Sinno on 2018/8/29.
//  Copyright © 2018年 sinno. All rights reserved.
//

#import "QDNavigationControllerDelegate.h"
#import "UINavigationController+QDNavigationBarHidden.h"
#import "UIViewController+QDNavigationBarHidden.h"

@implementation QDNavigationControllerDelegate


#pragma mark UINavigationControllerDelegate
// 将要显示控制器
- (void)navigationController:(UINavigationController *)navController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    // 处理导航栏
    if (self.navigationController.navigationBarHidden != viewController.qd_navigationBarHidden) {
        [self.navigationController setNavigationBarHidden:viewController.qd_navigationBarHidden animated:animated];
    }
    // 事件传递给真实的代理
    if (self.navRealDelegate && [self.navRealDelegate respondsToSelector:@selector(navigationController:willShowViewController:animated:)]) {
        [self.navRealDelegate navigationController:navController willShowViewController:viewController animated:animated];
    }
}


- (void)navigationController:(UINavigationController *)navc didShowViewController:(UIViewController *)vc animated:(BOOL)animated{
    if (self.navRealDelegate && [self.navRealDelegate respondsToSelector:@selector(navigationController:didShowViewController:animated:)]) {
        [self.navRealDelegate navigationController:navc didShowViewController:vc animated:animated];
    }
}

- (UIInterfaceOrientationMask)navigationControllerSupportedInterfaceOrientations:(UINavigationController *)navc{
    if (self.navRealDelegate && [self.navRealDelegate respondsToSelector:@selector(navigationControllerSupportedInterfaceOrientations:)]) {
       return [self.navRealDelegate navigationControllerSupportedInterfaceOrientations:navc];
    }
    return UIInterfaceOrientationMaskAll;
}
- (UIInterfaceOrientation)navigationControllerPreferredInterfaceOrientationForPresentation:(UINavigationController *)navc{
    if (self.navRealDelegate && [self.navRealDelegate respondsToSelector:@selector(navigationControllerPreferredInterfaceOrientationForPresentation:)]) {
        return [self.navRealDelegate navigationControllerPreferredInterfaceOrientationForPresentation:navc];
    }
    return [[UIApplication sharedApplication] statusBarOrientation];;
}
/*
- (nullable id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navc interactionControllerForAnimationController:(id <UIViewControllerAnimatedTransitioning>) animationController{
    if (self.navRealDelegate && [self.navRealDelegate respondsToSelector:@selector(navigationController:interactionControllerForAnimationController:)]) {
        return [self.navRealDelegate navigationController:navc interactionControllerForAnimationController:animationController];
    }
    return nil;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navc
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC{
    if (self.navRealDelegate && [self.navRealDelegate respondsToSelector:@selector(navigationController:animationControllerForOperation:fromViewController:toViewController:)]) {
        return [self.navRealDelegate navigationController:navc animationControllerForOperation:operation fromViewController:fromVC toViewController:toVC];
    }
    return nil;
}
 */
@end
