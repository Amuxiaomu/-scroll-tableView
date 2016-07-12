//
//  ViewController.m
//  一个scrool上面两个tableView
//
//  Created by Amuxiaomu on 16/7/12.
//  Copyright © 2016年 Amuxiaomu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic , weak)UITableView * tb1;
@property (nonatomic , weak)UITableView * tb2;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    
    UIScrollView *  sc  = [[UIScrollView alloc]init];
    
    CGFloat ScreenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat ScreenHeight = [UIScreen mainScreen].bounds.size.height;
    
    sc.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
    
    [self.view addSubview:sc];
    
    //第一个tableView
    UITableView * tb1 = [[UITableView alloc]initWithFrame:sc.bounds style:UITableViewStylePlain];
    
    tb1.backgroundColor = [UIColor yellowColor];
    
    //给第一个tableView 设置代理
    tb1.dataSource = self;
    tb1.delegate = self;
    
    [sc addSubview:tb1];
    self.tb1 = tb1;
    
    //第二个tableView
    UITableView * tb2 = [[UITableView alloc]initWithFrame:CGRectMake(ScreenWidth, 0, ScreenWidth, ScreenHeight) style:UITableViewStyleGrouped];
    
    tb2.backgroundColor = [UIColor greenColor];
    
    //给第二个tableView设置代理
    tb2.dataSource = self;
    tb2.delegate = self;
    [sc addSubview:tb2];
    self.tb2 = tb2;
    
    sc.contentSize = CGSizeMake(2*ScreenWidth, ScreenHeight);
    sc.pagingEnabled = YES;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [[UITableViewCell alloc]init];
    
    if (tableView == self.tb1) {
        
        cell.textLabel.text = @"121212";
    }else{
        cell.textLabel.text = @"张小龙";
    }
    
    return cell;
}
@end
