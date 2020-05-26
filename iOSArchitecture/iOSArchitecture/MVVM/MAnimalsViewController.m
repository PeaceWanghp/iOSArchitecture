//
//  MAnimalViewController.m
//  iOSArchitecture
//
//  Created by peace on 2018/9/12.
//  Copyright © 2018 peace. All rights reserved.
//

#import "MAnimalsViewController.h"

#import "MAnimalTableView.h"

@interface MAnimalsViewController ()

@end

@implementation MAnimalsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"MVVM";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Refresh"
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:self
                                                                             action:@selector(refreshAction)];
    
    MAnimalTableView *tableView = [[MAnimalTableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.view = tableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    NSLog(@"%s",__func__);
}

- (void)refreshAction {
    MAnimalTableView *tableView = (MAnimalTableView *)self.view;
    [tableView refreshData];
}

@end
