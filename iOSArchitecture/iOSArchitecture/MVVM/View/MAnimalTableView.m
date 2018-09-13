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
        
        self.viewModel = [[MAnimalViewModel alloc] init];
        self.viewModel.delegate = self;
    }
    return self;
}

#pragma mark -
#pragma mark -- MAnimalViewModel Delegate
- (void)viewModel:(MAnimalViewModel *)viewModel reloadRow:(NSInteger)row {
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:0];
    [self reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
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
    
    MAnimalViewEntity *entity = [_viewModel animalEntityWitIndexPath:indexPath.row];
    
    cell.textLabel.text = entity.name;
    cell.detailTextLabel.text = entity.summary;
    [cell showImageWithData:entity.imageData];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
