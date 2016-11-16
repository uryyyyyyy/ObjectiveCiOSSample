//
//  ViewController.m
//  ObjectiveCiOSSample
//
//  Created by 柴田幸輝 on 2016/11/15.
//  Copyright © 2016年 柴田幸輝. All rights reserved.
//

#import "ViewController.h"
#import "MyModalViewController.h"
#import "MyTabViewController.h"

@implementation ViewController

@synthesize items;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    items = (NSMutableArray *)@[@"push View",@"modal View",@"Tab View"];
    UITableView *myTableView = [[UITableView alloc] initWithFrame:[self.view frame]];
    [self.view addSubview:myTableView];
    myTableView.dataSource = self;
    myTableView.delegate = self;
    
    self.navigationItem.title = @"タイトル";
    
    NSLog(@"hello");
}

//click event
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 選択されたセルを取得
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    NSString *name = cell.textLabel.text;
    
    if([name  isEqual: @"push View"]){
        NSLog(@"hello");
        MyModalViewController *tabView = [[MyModalViewController alloc] init];
        [self.navigationController pushViewController:tabView animated:YES];
    }else if([name  isEqual: @"modal View"]){
        MyModalViewController *tabView = [[MyModalViewController alloc] init];
        [self presentViewController: tabView animated:YES completion: nil];
    }else if([name  isEqual: @"Tab View"]){
        UITabBarController *tabBar = [[UITabBarController alloc] init];
        
        UIViewController *tabView1 = [[MyModalViewController alloc] init];
        tabView1.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemMostRecent tag:1];
        tabView1.title = @"画面1";
        
        UIViewController *tabView2 = [[MyModalViewController alloc] init];
        tabView2.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemMostRecent tag:2];
        
        NSArray *views = [NSArray arrayWithObjects:tabView1, tabView2, nil];
        [tabBar setViewControllers:views animated:NO];
        
        [self.navigationController pushViewController:tabBar animated:YES];
    }
}

//テーブルの行数を返す
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return items.count;
}

//テーブルの中のセルの情報を返す
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cid = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cid];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cid];
    }
    cell.textLabel.text = items[indexPath.row];
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
