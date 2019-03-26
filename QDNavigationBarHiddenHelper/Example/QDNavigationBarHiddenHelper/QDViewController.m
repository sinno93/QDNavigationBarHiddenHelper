//
//  QDViewController.m
//  QDNavigationBarHiddenHelper
//
//  Created by sinno93 on 03/25/2019.
//  Copyright (c) 2019 sinno93. All rights reserved.
//

#import "QDViewController.h"
#import <QDNavigationBarHiddenHelper/QDNavigationBarHiddenHelper-umbrella.h>
@interface QDViewController ()


@end

@implementation QDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.qd_navigationBarHiddenHelperEnabled = YES;
    self.title = @"导航栏";
	// Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - Action

- (IBAction)pushToControllerWithNavigationBarAction:(id)sender {
    UIViewController *controller = [[QDViewController alloc] init];
    controller.qd_navigationBarHidden = NO;
    [self.navigationController pushViewController:controller animated:YES];
}

- (IBAction)pushToControllerWithoutNavigationBarAction:(id)sender {
    UIViewController *controller = [[QDViewController alloc] init];
    controller.qd_navigationBarHidden = YES;
    [self.navigationController pushViewController:controller animated:YES];
}

@end
