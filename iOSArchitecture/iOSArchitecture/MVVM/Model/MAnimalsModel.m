//
//  MAnimalModel.m
//  iOSArchitecture
//
//  Created by peace on 2018/9/12.
//  Copyright © 2018 peace. All rights reserved.
//

#import "MAnimalsModel.h"

@implementation MAnimalsModel

- (instancetype)init {
    self = [super init];
    if (self) {
        [self loadDataSource];
    }
    return self;
}

- (void)dealloc {
    NSLog(@"%s",__func__);
}

- (NSArray *)loadJson {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"jsonString" ofType:@"json"];
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

- (void)loadDataSource {
    NSArray *array = [self loadJson];
    NSMutableArray *mutableArray = [NSMutableArray arrayWithCapacity:array.count];
    
    for (NSDictionary *dictionary in array) {
        MAnimalModel *model = [[MAnimalModel alloc] init];
        model.identifier = [[NSDate date] timeIntervalSince1970];
        model.imageUrl = [dictionary objectForKey:@"url"];
        model.name = [dictionary objectForKey:@"name"];
        model.summary = [dictionary objectForKey:@"summary"];
        
        [mutableArray addObject:model];
    }
    
    _dataSource = mutableArray;
}

- (void)downloadImageWtihModel:(MAnimalModel *)animalModel {
    if (animalModel.isLoading || !animalModel.imageUrl || animalModel.imageUrl.length == 0) {
        return;
    }
    
    animalModel.isLoading = YES;
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSURL *imageURL = [NSURL URLWithString:animalModel.imageUrl];
        NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
        if (imageData) {
            animalModel.imageData = imageData;
        }
        NSLog(@"imageData = %@",imageData);
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (self.delegate && [self.delegate respondsToSelector:@selector(animalShowImage:row:)]) {
                NSInteger row = [self.dataSource indexOfObject:animalModel];
                [self.delegate animalShowImage:animalModel row:row];
            }
        });
    });
}

@end
