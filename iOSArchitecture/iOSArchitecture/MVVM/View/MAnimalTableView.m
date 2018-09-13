//
//  MAnimalTableView.m
//  iOSArchitecture
//
//  Created by peace on 2018/9/12.
//  Copyright © 2018 peace. All rights reserved.
//

#import "MAnimalTableView.h"

#import "MAnimalCell.h"

@interface MAnimalTableView()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation MAnimalTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        
        self.viewModel = [[MAnimalViewModel alloc] init];
    }
    return self;
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
    
    MAnimalViewEntity *entity = [self.viewModel.dataSource objectAtIndex:indexPath.row];
    
    cell.textLabel.text = entity.name;
    cell.detailTextLabel.text = entity.summary;
    [cell showImageWithData:entity.imageData];
    
    return cell;
}

#pragma mark -
#pragma mark --
- (void)animalRloadRow:(NSInteger)row {
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:0];
    [self reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath,nil]
                          withRowAnimation:UITableViewRowAnimationNone];
}

@end
