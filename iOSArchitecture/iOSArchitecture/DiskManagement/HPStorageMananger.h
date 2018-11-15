//
//  ARDiskMananger.h
//  iOSArchitecture
//
//  Created by peace on 2018/11/6.
//  Copyright © 2018 peace. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HPStorageMananger : NSObject

+ (instancetype)diskManager;

- (NSInteger)fileSizeWithPath:(NSString *)path;

- (NSArray *)components;
- (NSArray *)componentsWithPath:(NSString *)path;

- (void)ignorePaths:(NSArray *)paths;

@end

@interface HPDirectory : NSObject

@property (nonatomic,copy) NSString *superPath;     //"/user/xxx/"
@property (nonatomic,copy) NSString *path;          //"/user/xxx/abc.png"
@property (nonatomic,copy) NSString *rootPath;      //"/user/"

@property (nonatomic,assign) BOOL isDrictor;
@property (nonatomic,assign) NSInteger level;

@property (nonatomic,assign) BOOL isRead;
@property (nonatomic,assign) BOOL isWrite;
@property (nonatomic,assign) BOOL isDelete;

@property (nonatomic,copy) NSString *name;      //"abc.png"
@property (nonatomic,copy) NSString *suffix;    //"png"
@property (nonatomic,assign) NSInteger size;

@end

NS_ASSUME_NONNULL_END
