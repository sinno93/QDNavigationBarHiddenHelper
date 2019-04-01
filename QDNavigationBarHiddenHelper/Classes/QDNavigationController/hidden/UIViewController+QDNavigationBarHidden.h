//
//  UIViewController+QDNavigationBarHidden.h
//  Pods-QDNavigationBarHiddenHelper_Example
//
//  Created by Sinno on 2019/3/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (QDNavigationBarHidden)
/**
 是否隐藏导航栏，默认否
 */
@property(nonatomic,assign)BOOL qd_navigationBarHidden;
@end

NS_ASSUME_NONNULL_END
