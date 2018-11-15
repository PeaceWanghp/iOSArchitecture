//
//  ARDiskMananger.m
//  iOSArchitecture
//
//  Created by peace on 2018/11/6.
//  Copyright © 2018 peace. All rights reserved.
//

#import "HPStorageMananger.h"

@interface HPStorageMananger()

@property (nonatomic,strong) NSArray *ignorePaths;

@end

@implementation HPStorageMananger

#pragma mark -
#pragma mark -- Life Cycle
+ (instancetype)diskManager {
    HPStorageMananger *manager = [[HPStorageMananger alloc] init];
    return manager;
}

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
#pragma mark -- custome
- (NSInteger)fileAttributeWithPath:(NSString *)path {
    NSError *error;
    NSDictionary *fileAttribute = [[NSFileManager defaultManager] attributesOfItemAtPath:path error:&error];
    if (fileAttribute && !error) {
        NSNumber *fileSize = [fileAttribute objectForKey:@"NSFileSize"];
        NSLog(@"fileAttribute = %@",fileAttribute);
        return fileSize.integerValue;
    }
    else {
        return 0;
    }
}

- (NSInteger)fileSizeWithPath:(NSString *)path {
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]){
        return [[[NSFileManager defaultManager] attributesOfItemAtPath:path error:nil] fileSize];
    }
    return 0;
}

- (NSArray *)components {
    return [self componentsWithPath:NSHomeDirectory()];
}

- (NSArray *)componentsWithPath:(NSString *)path {
    if (!path || path.length == 0) {
        return nil;
    }
    
    NSLog(@"path = %@",path);
    NSError *error = nil;
    NSArray *subpaths = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:path error:&error];
    if (error) {
        NSLog(@"error = %@",error);
        return nil;
    }
    
    NSString *removePath = [NSString stringWithFormat:@"%@",NSHomeDirectory()];
    NSString *rootPath = [path substringFromIndex:removePath.length];
    NSMutableArray *mutableArray = [NSMutableArray array];
    
    for (NSString *subpath in subpaths) {
    
        HPDirectory *directory = [[HPDirectory alloc] init];
        directory.superPath = path;
        directory.path = [NSString stringWithFormat:@"%@/%@",path,subpath];
        NSString *levelPath = [NSString stringWithFormat:@"%@/%@",rootPath,subpath];
        directory.rootPath = levelPath;
        
        NSArray *components = [levelPath componentsSeparatedByString:@"/"];
        directory.name = components.lastObject;
        directory.level = components.count - 1;
        NSLog(@"levelPath = %@ level = %lu",levelPath,(unsigned long)components.count);
        
        if (!directory.isDrictor) {
            directory.suffix = [directory.name componentsSeparatedByString:@"."].lastObject;
        }
        
        BOOL isDir;
        [[NSFileManager defaultManager] fileExistsAtPath:directory.path isDirectory:&isDir];
        directory.isDrictor = isDir;
        
        directory.isRead = [[NSFileManager defaultManager] isReadableFileAtPath:directory.path];
        directory.isWrite = [[NSFileManager defaultManager] isWritableFileAtPath:directory.path];
        directory.isDelete = [[NSFileManager defaultManager] isDeletableFileAtPath:directory.path];
        
        [mutableArray addObject:directory];
    }
    
    return mutableArray;
}

- (void)ignorePaths:(NSArray *)paths {
    _ignorePaths = [NSArray arrayWithArray:paths];
}

#pragma mark -
#pragma mark -- Private
//    //Document
//    NSArray *documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSLog(@"document path = %@",documentPath);
//
//    //Cache
//    NSArray *cachePath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
//    NSLog(@"cache path = %@",cachePath);
//
//    //Tmp
//    NSString *tmpPath = NSTemporaryDirectory();
//    NSLog(@"tmp path = %@",tmpPath);

@end

@implementation HPDirectory
@end
