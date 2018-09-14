//
//  AnimalModel.m
//  iOSArchitecture
//
//  Created by peace on 2018/9/10.
//  Copyright © 2018 peace. All rights reserved.
//

#import "AnimalModel.h"

@implementation AnimalModel

- (instancetype)init {
    self = [super init];
    if (self) {
        NSMutableArray *mutableArray = [NSMutableArray array];
        
        AnimalEntity *entity = nil;
        NSArray *animals = [self loadJson];
        for (NSDictionary *animal in animals) {
            entity = [[AnimalEntity alloc] init];
            entity.identifier = [[NSDate date] timeIntervalSince1970];
            entity.imageUrl = [animal objectForKey:@"url"];
            entity.name = [animal objectForKey:@"name"];
            entity.summary = [animal objectForKey:@"summary"];
            [mutableArray addObject:entity];
        }
        
        _dataSource = mutableArray;
    }
    return self;
}

- (NSArray *)loadJson {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"animal" ofType:@"json"];
    NSData *jsonData = [NSData dataWithContentsOfFile:path];
    NSError *error = nil;
    id jsonObject = [NSJSONSerialization JSONObjectWithData:jsonData options:(NSJSONReadingMutableLeaves) error:&error];
    if ([jsonObject isKindOfClass:[NSArray class]]) {
        return jsonObject;
    }
    else {
        return nil;
    }
}

- (AnimalEntity *)animalEntityWitIndexPath:(NSInteger)row {
    AnimalEntity *entity = [_dataSource objectAtIndex:row];
    if (entity.imageUrl && !entity.imageData) {
        [self downloadImageWtihEntity:entity];
    }
    
    return entity;
}

- (void)downloadImageWtihEntity:(AnimalEntity *)entity {
    if (entity.isLoading || !entity.imageUrl || entity.imageUrl.length == 0) {
        return;
    }
    
    entity.isLoading = YES;
    
    dispatch_queue_t globalQueue = dispatch_get_global_queue(0, 0);
    dispatch_async(globalQueue, ^{
        
        NSLog(@"开始下载图片:%@", [NSThread currentThread]);
        
        NSURL *imageURL = [NSURL URLWithString:entity.imageUrl];
        //下载图片
        NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
        if (imageData) {
            entity.imageData = imageData;
        }
        NSLog(@"imageData = %@",imageData);
        
        //从子线程回到主线程(方式二：常用)
        //组合：主队列异步执行
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"回到主线程:%@", [NSThread currentThread]);
            //更新界面
            if (self.delegate && [self.delegate respondsToSelector:@selector(animalShowImage:row:)]) {
                NSInteger row = [self.dataSource indexOfObject:entity];
                [self.delegate animalShowImage:entity row:row];
            }
        });
    });
}

@end
