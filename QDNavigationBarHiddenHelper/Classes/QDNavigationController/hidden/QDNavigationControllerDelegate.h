//
//  QDNavigationControllerDelegate.h
//  QDNavigationControllerDemo
//
//  Created by Sinno on 2018/8/29.
//  Copyright © 2018年 sinno. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QDNavigationControllerDelegate : NSObject<UINavigationControllerDelegate>
@property (nonatomic, weak) UINavigationController *navigationController;
@property (nonatomic, weak) id<UINavigationControllerDelegate> navRealDelegate;// 真实的代理
@end
