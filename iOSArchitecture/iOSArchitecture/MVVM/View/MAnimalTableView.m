//
//  MAnimalTableView.m
//  iOSArchitecture
//
//  Created by peace on 2018/9/12.
//  Copyright © 2018 peace. All rights reserved.
//

#import "MAnimalTableView.h"

#import "MAnimalCell.h"

@interface MAnimalTableView()<UITableViewDelegate,UITableViewDataSource,MAnimalViewModelDelegate>

@end

@implementation MAnimalTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        
        self.viewModel = [[MAnimalsViewModel alloc] init];
        self.viewModel.delegate = self;
    }
    return self;
}

- (void)dealloc {
    NSLog(@"%s",__func__);
}

- (void)refreshData {
    [self.viewModel reloadData];
}

#pragma mark -
#pragma mark -- MAnimalViewModel Delegate
- (void)viewModel:(MAnimalsViewModel *)viewModel reloadRow:(NSInteger)row {
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:0];
    [self reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
}

- (void)reloadDataWithViewModel:(MAnimalsViewModel *)viewModel {
    [self reloadData];
}

#pragma mark -
#pragma mark -- Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuseIdentifier = @"reuseIdentifier";
    MAnimalCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (!cell) {
        cell = [[MAnimalCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
    }
    
    MAnimalViewModel *viewModel = [_viewModel animalEntityWitIndexPath:indexPath.row];
    
    cell.textLabel.text = viewModel.name;
    cell.detailTextLabel.text = viewModel.summary;
    [cell showImageWithData:viewModel.imageData];
    
    return cell;
}

#pragma mark -
#pragma mark -- UITableView Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewRowAction *deleteAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive
                                                                            title:@"Delete"
                                                                          handler:^(UITableViewRowAction *action,
                                                                                    NSIndexPath *indexPath) {
                                                                              [self.viewModel deleteWithRow:indexPath.row];
                                                                              
                                                                              [tableView beginUpdates];
                                                                              [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
                                                                              [tableView endUpdates];
                                                                          }];
    return @[deleteAction];
}


@end
