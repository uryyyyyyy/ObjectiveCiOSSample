//
//  MyTabViewController.m
//  ObjectiveCiOSSample
//
//  Created by 柴田幸輝 on 2016/11/16.
//  Copyright © 2016年 柴田幸輝. All rights reserved.
//

#import "MyModalViewController.h"

@implementation MyModalViewController

- (void)loadView{
    [super loadView];
    UIColor *customColor = [UIColor colorWithRed:0.2 green:0.8 blue:0.8 alpha:1.0];
    self.view.backgroundColor = customColor;
    
    self.navigationItem.title = @"Modal";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self action:@selector(aMethod:)
     forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"Back" forState:UIControlStateNormal];
    button.frame = CGRectMake(80.0, 210.0, 160.0, 40.0);
    [self.view addSubview:button];
}

- (IBAction)aMethod:(id)sender {
    NSLog(@"Click");
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)aMethod {
    NSLog(@"click");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
