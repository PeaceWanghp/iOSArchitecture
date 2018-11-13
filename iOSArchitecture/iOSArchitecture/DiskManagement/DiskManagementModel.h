//
//  DiskManagementModel.h
//  iOSArchitecture
//
//  Created by peace on 2018/11/6.
//  Copyright © 2018 peace. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DistItem;

@interface DiskManagementModel : NSObject

@property (nonatomic,readonly) NSArray *dataSource;

- (void)loadDataCompletion:(void(^)(BOOL value))completion;

- (void)openItem:(DistItem *)item completion:(void(^)(BOOL value))completion;
- (void)closeItem:(DistItem *)item;

@end

@interface DistItem : NSObject

@property (nonatomic,assign) BOOL isOpen;

@property (nonatomic,assign) NSInteger level;
@property (nonatomic,assign) BOOL isDrictor;

@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *path;
@property (nonatomic,copy) NSString *superPath;

@property (nonatomic,assign) NSInteger size;//字节

@end
