//
//  UINavigationController+QDNavigationBarHidden.h
//  Pods-QDNavigationBarHiddenHelper_Example
//
//  Created by Sinno on 2019/3/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UINavigationController (QDNavigationBarHidden)

/**
 导航栏隐藏控制功能是否打开
 YES:打开,NO:关闭；默认为NO,即关闭
 */
@property (nonatomic, assign) BOOL qd_navigationBarHiddenHelperEnabled;
@end

NS_ASSUME_NONNULL_END
