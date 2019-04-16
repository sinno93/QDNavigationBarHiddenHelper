//
//  QDNavigationImageManager.m
//  Pods-QDNavigationBarHiddenHelper_Example
//
//  Created by Sinno on 2019/4/14.
//

#import "QDNavigationImageManager.h"

@implementation QDNavigationImageManager

+ (UIImage *)imageWithName:(NSString *)name {
    NSBundle *bundle = [NSBundle bundleForClass:self];
    NSString *bundlePath = bundle.bundlePath;
    NSString *resourcePath = bundle.resourcePath;
    NSString *resourceBundlePath = [bundle.resourcePath stringByAppendingPathComponent:@"bundle_name_abc.bundle"];
//    NSString *resourceBundlePath = [bundle.resourcePath stringByAppendingPathComponent:@"hello.bundle"];
    NSBundle *resourceBundle = [NSBundle bundleWithPath:resourceBundlePath];
    NSString *localString = [resourceBundle localizedStringForKey:@"inlineKey" value:nil table:@"test"];
    NSLog(@"localStr:%@",localString);
    UIImage *image = [UIImage imageNamed:name inBundle:resourceBundle compatibleWithTraitCollection:nil ];
    return image;
}
@end
