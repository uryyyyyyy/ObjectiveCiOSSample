//
//  MyTabViewController.m
//  ObjectiveCiOSSample
//
//  Created by 柴田幸輝 on 2016/11/16.
//  Copyright © 2016年 柴田幸輝. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MyTabViewController.h"
#import "MyModalViewController.h"

@implementation MyTabViewController

- (void)loadView{
    [super loadView];
    
    self.navigationItem.title = @"Tab View";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITabBarController *tab = [[UITabBarController alloc] init];
    
    UIViewController *tabView1 = [[MyModalViewController alloc] init];
    tabView1.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemMostRecent tag:1];
    tabView1.title = @"画面1";
    
    UIViewController *tabView2 = [[MyModalViewController alloc] init];
    tabView2.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemMostRecent tag:2];
    
    NSArray *views = [NSArray arrayWithObjects:tabView1, tabView2, nil];
    [tab setViewControllers:views animated:NO];
}

@end
