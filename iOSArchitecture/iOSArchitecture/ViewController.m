//
//  ViewController.m
//  iOSArchitecture
//
//  Created by peace on 2018/9/10.
//  Copyright © 2018 peace. All rights reserved.
//

#import "ViewController.h"

#import "AnimalTableViewController.h"
#import "MAnimalViewController.h"
#import "MRViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong) NSMutableArray *dataSource;


@end

@implementation ViewController

#pragma mark -
#pragma mark -- Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _dataSource = [NSMutableArray array];
    [_dataSource addObject:@"MVC"];
    [_dataSource addObject:@"MVVM"];
    [_dataSource addObject:@"MVVM+RAC"];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark -- UITableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = [_dataSource objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 0) {
        AnimalTableViewController *viewController = [[AnimalTableViewController alloc] initWithStyle:UITableViewStylePlain];
        [self.navigationController pushViewController:viewController animated:YES];
    }
    else if (indexPath.row == 1) {
        MAnimalViewController *viewController = [[MAnimalViewController alloc] init];
        [self.navigationController pushViewController:viewController animated:YES];
    }
    else if (indexPath.row == 2) {
        MRViewController *viewController = [[MRViewController alloc] init];
        [self.navigationController pushViewController:viewController animated:YES];
    }
}

@end
