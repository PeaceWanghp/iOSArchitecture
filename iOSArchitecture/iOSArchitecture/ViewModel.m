//
//  ViewModel.m
//  iOSArchitecture
//
//  Created by peace on 2018/11/6.
//  Copyright © 2018 peace. All rights reserved.
//

#import "ViewModel.h"

@implementation ViewModel

- (instancetype)init {
    self = [super init];
    if (self) {
        _dataSource = [NSMutableArray array];
        
        ACItem *item = nil;
        
        item = [[ACItem alloc] init];
        item.title = @"磁盘空间/Disk Management";
        item.subtitle = @"Document、Cache、tmp (NSFileManager)";
        item.className = @"DiskManagementTableViewController";
        item.classType = ACUITableViewController;
        [_dataSource addObject:item];
    }
    
    return self;
}

@end

#pragma mark -
#pragma mark -- List Item

@implementation ACItem



@end
