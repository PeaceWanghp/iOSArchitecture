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
        
        NSString *size = [self fileSize:[_manager fileSizeWithPath:directory.path]];
        NSString *read = directory.isRead ? @"可读":@"不可读";
        NSString *write = directory.isWrite ? @"可写":@"不可写";
        NSString *delete = directory.isDelete ? @"可删":@"不可删";
        item.subtitle = [NSString stringWithFormat:@"%@(%@,%@,%@)",size,read,write,delete];
        
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

- (NSString *)fileSize:(NSInteger)size {
    NSInteger gNumber = 1024 * 1024 * 1024;
    NSInteger mNumber = 1024 * 1024;
    NSInteger kNumber = 1024;
    
    NSInteger mSize = size%gNumber;
    NSInteger kSize = mSize%mNumber;
    NSInteger bSize = kSize%kNumber;
    
    NSInteger gValue = size/gNumber;
    NSInteger mValue = mSize/mNumber;
    NSInteger kValue = kSize/kNumber;
    NSInteger bValue = bSize;
    
//    NSLog(@"gSize = %ld,mSize = %ld,kSize = %ld,bSize = %ld",gSize,mSize,kSize,bSize);
    return [NSString stringWithFormat:@"%ldG,%ldM,%ldK,%ldB",(long)gValue,(long)mValue,(long)kValue,(long)bValue];
    
//    if (gValue > 0) {
//        //G
//        return [NSString stringWithFormat:@"%ld.%ldG",(long)gSize,(long)mSize];
//    }
//    else if (gValue > 0 && mValue > 0) {
//        //M
//        return [NSString stringWithFormat:@"%ld.%ldM",(long)mNumber,(long)kSize];
//    }
//    else if (gValue > 0 && mValue > 0 && kValue > 0) {
//        //KB
//        return [NSString stringWithFormat:@"%ld.%ldKB",(long)kSize,(long)mSize];
//    }
//    else {
//        //B
//        return [NSString stringWithFormat:@"%ldB",(long)bSize];
//    }
}

@end

@implementation DistItem

@end
