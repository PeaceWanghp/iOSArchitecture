//
//  DiskManagementModel.m
//  iOSArchitecture
//
//  Created by peace on 2018/11/6.
//  Copyright © 2018 peace. All rights reserved.
//

#import "DiskManagementModel.h"

@implementation DiskManagementModel

#pragma mark -
#pragma mark -- Life Cycle
- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    
    return self;
}

- (void)dealloc {
    NSLog(@"%s",__func__);
}

#pragma mark -
#pragma mark -- Data
- (void)loadDataCompletion:(void(^)(NSArray *items))completion {
    if (!completion) {
        return;
    }
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSArray *array = [self loadData];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            completion(array);
        });
    });
}

- (NSArray *)loadData {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    return nil;
}

@end

@implementation DiskFile
@end
