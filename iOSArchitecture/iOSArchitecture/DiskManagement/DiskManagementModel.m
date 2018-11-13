//
//  DiskManagementModel.m
//  iOSArchitecture
//
//  Created by peace on 2018/11/6.
//  Copyright © 2018 peace. All rights reserved.
//

#import "DiskManagementModel.h"

#import "HPStorageMananger.h"

@interface DiskManagementModel()

@property (nonatomic,strong) NSMutableArray *mutableArray;
@property (nonatomic,strong) HPStorageMananger *manager;

@end

@implementation DiskManagementModel

#pragma mark -
#pragma mark -- Life Cycle
- (instancetype)init {
    self = [super init];
    if (self) {
        _mutableArray = [NSMutableArray array];
        
        _manager = [HPStorageMananger diskManager];
    }
    
    return self;
}

- (void)dealloc {
    NSLog(@"%s",__func__);
}

#pragma mark -
#pragma mark -- Data
- (void)loadDataCompletion:(void(^)(BOOL value))completion {
    if (!completion) {
        return;
    }
    
    [self openItem:nil completion:completion];
}

- (void)openItem:(DistItem *)item completion:(void(^)(BOOL value))completion {
    if (!completion) {
        return;
    }
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSArray *array = [self loadData:item];
        array = [self itemsForDirctories:array];
        if (self.mutableArray.count == 0) {
            [self.mutableArray addObjectsFromArray:array];
        }
        else {
            NSInteger loc = [self.mutableArray indexOfObject:item]+1;
            NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(loc, array.count)];
            [self.mutableArray insertObjects:array atIndexes:indexSet];
        }
        
        self.dataSource = self.mutableArray;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            item.isOpen = !item.isOpen;
            completion(array);
        });
    });
}

- (void)closeItem:(DistItem *)closeItem {
    closeItem.isOpen = !closeItem.isOpen;
    
    NSInteger index = 0;
    do {
        DistItem *item = [self.mutableArray objectAtIndex:index];
        if ([item.path hasPrefix:closeItem.path] && item.level > closeItem.level) {
            [self.mutableArray removeObject:item];
            
            index = 0;
            
            continue;
        }
        
        index ++;
        
    } while (self.mutableArray.count > index);
    
}

- (void)setDataSource:(NSArray *)dataSource {
    _dataSource = dataSource;
}

- (NSArray *)itemsForDirctories:(NSArray *)dirctories {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:dirctories.count];
    for (HPDirectory *directory in dirctories) {
        DistItem *item = [[DistItem alloc] init];
        item.isDrictor = directory.isDrictor;
        item.superPath = directory.superPath;
        item.path = directory.path;
        item.name = directory.name;
        item.level = directory.level;
        item.size = [_manager storageWithPath:directory.path];
        [array addObject:item];
    }
    return array;
}

- (NSArray *)loadData:(DistItem *)item {
    if (item) {
        return [_manager componentsWithPath:item.path];
    }
    else {
        return [_manager components];
    }
}

@end

@implementation DistItem

@end
