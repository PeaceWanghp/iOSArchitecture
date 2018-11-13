//
//  DiskManagementTableViewController.m
//  iOSArchitecture
//
//  Created by peace on 2018/11/6.
//  Copyright © 2018 peace. All rights reserved.
//

#import "DiskManagementTableViewController.h"

#import "DiskManagementModel.h"
#import "HPPreviewController.h"

@interface DiskManagementTableViewController ()
@property (nonatomic,strong) DiskManagementModel *model;
@end

@implementation DiskManagementTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    _model = [[DiskManagementModel alloc] init];
    [_model loadDataCompletion:^(BOOL value) {
        if (value) {
            [self.tableView reloadData];
        }
    }];
}

#pragma mark -
#pragma mark -- Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _model.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    DistItem *item = [_model.dataSource objectAtIndex:indexPath.row];
    cell.textLabel.text = [self textWithName:item.name level:item.level];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    DistItem *item = [_model.dataSource objectAtIndex:indexPath.row];
    if (item.isDrictor) {
        //open/close
        if (!item.isOpen) {
            [_model openItem:item completion:^(BOOL value) {
                if (value) {
                    [self.tableView reloadData];
                }
            }];
        }
        else {
            [_model closeItem:item];
            [self.tableView reloadData];
        }
    }
    else {
        //prview
        HPPreviewController *previewController = [[HPPreviewController alloc] init];
        previewController.path = item.path;
        [self presentViewController:previewController animated:YES completion:nil];
    }
}

#pragma mark -
#pragma mark -- private
- (NSString *)textWithName:(NSString *)name level:(NSInteger)level {
    NSMutableString *levelString = [NSMutableString string];
    for (int i = 0; i < level; i++) {
        [levelString appendString:@"   "];
    }
    return [NSString stringWithFormat:@"%@%@",levelString,name];
}

@end
