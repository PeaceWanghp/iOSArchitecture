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
#import "DiskManagementTableViewController.h"

#import "ViewModel.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) ViewModel *viewModel;
@end

@implementation ViewController

#pragma mark -
#pragma mark -- Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _viewModel = [[ViewModel alloc] init];
    
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
    return _viewModel.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    
    ACItem *item = [_viewModel.dataSource objectAtIndex:indexPath.row];
    cell.textLabel.text = item.title;
    cell.detailTextLabel.text = item.subtitle;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    ACItem *item = [_viewModel.dataSource objectAtIndex:indexPath.row];
    if (item.className) {
        Class class = NSClassFromString(item.className);
        UIViewController *viewController;
        
        if ([item.classType isEqualToString:ACUITableViewController]) {
            viewController = [[class alloc] initWithStyle:UITableViewStylePlain];
        }
        else if ([item.classType isEqualToString:ACUIViewController]) {
            viewController = [[class alloc] init];
        }
        [self.navigationController pushViewController:viewController animated:YES];
    }
}

@end
