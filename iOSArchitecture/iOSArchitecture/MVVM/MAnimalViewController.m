//
//  MAnimalViewController.m
//  iOSArchitecture
//
//  Created by peace on 2018/9/12.
//  Copyright © 2018 peace. All rights reserved.
//

#import "MAnimalViewController.h"

#import "MAnimalTableView.h"

@interface MAnimalViewController ()

@end

@implementation MAnimalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"MVVM";
    
    MAnimalTableView *tableView = [[MAnimalTableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.view = tableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
