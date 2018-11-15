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
    
    [[self class] addTestFile];
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
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    DistItem *item = [_model.dataSource objectAtIndex:indexPath.row];
    cell.textLabel.text = [self textWithName:item.name level:item.level];
    cell.detailTextLabel.text = [self textWithName:item.subtitle level:item.level];
    
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

+ (void)addTestFile {
    
    //创建NSFileManager对象
    NSFileManager *fm = [NSFileManager defaultManager];
    //定义路径(这里面要有该路径，而且要带着你要写入文件的文件名。)
//    NSString *path = [NSString stringWithFormat:@"%@youyi.txt",NSTemporaryDirectory()];
//    NSString *path = [NSString stringWithFormat:@"%@/Library/Preferences/youyi.txt",NSHomeDirectory()];
//    NSString *path = [NSString stringWithFormat:@"%@/Library/youyi.txt",NSHomeDirectory()];
//    NSString *path = [NSString stringWithFormat:@"%@/youyi.txt",NSHomeDirectory()];
    NSString *path = [NSString stringWithFormat:@"%@/SystemData/youyi.txt",NSHomeDirectory()];

    //1文件创建
    //1)要存储在文件的内容
    NSString *contentStr = @"每当我错过一个女孩，我就往山上放一块砖，于是乎有了长城";
    //2)把字符串转化为data类型   （目的：用来存放到文件中）
    NSData *data = [contentStr dataUsingEncoding:NSUTF8StringEncoding];
    //3)创建文件
    BOOL isCtreat;
    isCtreat = [fm createFileAtPath:path contents:data attributes:nil];
    if (isCtreat) {
        NSLog(@"文件创建###成功###");
    }
    else {
        NSLog(@"文件创建###失败###");
    }
}

@end
