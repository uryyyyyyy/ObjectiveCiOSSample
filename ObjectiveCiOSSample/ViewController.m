//
//  ViewController.m
//  ObjectiveCiOSSample
//
//  Created by 柴田幸輝 on 2016/11/15.
//  Copyright © 2016年 柴田幸輝. All rights reserved.
//

#import "ViewController.h"
#import "MyTabViewController.h"

@implementation ViewController

@synthesize items;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    items = (NSMutableArray *)@[@"push VC",@"modal VC",@"c"];
    UITableView *myTableView = [[UITableView alloc] initWithFrame:[self.view frame]];
    [self.view addSubview:myTableView];
    myTableView.dataSource = self;
    myTableView.delegate = self;
    
    NSLog(@"hello");
}

//click event
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 選択されたセルを取得
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    NSString *name = cell.textLabel.text;
    
    if([name  isEqual: @"push VC"]){
        NSLog(@"hello");
        MyTabViewController *tabView = [[MyTabViewController alloc] init];
        NSLog(@"self.navigationController=%@", self.navigationController);
        [self.navigationController pushViewController:tabView animated:YES];
    }else if([name  isEqual: @"modal VC"]){
        MyTabViewController *tabView = [[MyTabViewController alloc] init];
        [self presentViewController: tabView animated:YES completion: nil];
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
