//
//  AnimalTableViewController.m
//  iOSArchitecture
//
//  Created by peace on 2018/9/10.
//  Copyright © 2018 peace. All rights reserved.
//

#import "AnimalTableViewController.h"

#import "AnimalCell.h"
#import "AnimalModel.h"

@interface AnimalTableViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) AnimalModel *animalModel;
@end

@implementation AnimalTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _animalModel = [[AnimalModel alloc] init];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _animalModel.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuseIdentifier = @"reuseIdentifier";
    AnimalCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    if (!cell) {
        cell = [[AnimalCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    
    AnimalEntity *entity = [_animalModel animalEntityWitIndexPath:indexPath.row];
    
    cell.textLabel.text = entity.name;
    cell.detailTextLabel.text = entity.description;
    [cell showImageWithData:entity.imageData];
    
    return cell;
}

#pragma mark -
#pragma mark --
- (void)animalShowImage:(AnimalEntity *)entity row:(NSInteger)row {
    
}

@end
