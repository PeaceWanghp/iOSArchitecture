//
//  MAnimalModel.m
//  iOSArchitecture
//
//  Created by peace on 2018/9/12.
//  Copyright © 2018 peace. All rights reserved.
//

#import "MAnimalModel.h"

@implementation MAnimalModel

- (instancetype)init {
    self = [super init];
    if (self) {
        [self loadDataSource];
    }
    return self;
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
        MAnimalEntity *entity = [[MAnimalEntity alloc] init];
        entity.identifier = [[NSDate date] timeIntervalSince1970];
        entity.imageUrl = [dictionary objectForKey:@"url"];
        entity.name = [dictionary objectForKey:@"name"];
        entity.summary = [dictionary objectForKey:@"summary"];
        
        [mutableArray addObject:entity];
    }
    
    _dataSource = mutableArray;
}

- (void)downloadImageWtihEntity:(MAnimalEntity *)entity {
    if (entity.isLoading || !entity.imageUrl || entity.imageUrl.length == 0) {
        return;
    }
    
    entity.isLoading = YES;
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSURL *imageURL = [NSURL URLWithString:entity.imageUrl];
        NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
        if (imageData) {
            entity.imageData = imageData;
        }
        NSLog(@"imageData = %@",imageData);
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (self.delegate && [self.delegate respondsToSelector:@selector(animalShowImage:row:)]) {
                NSInteger row = [self.dataSource indexOfObject:entity];
                [self.delegate animalShowImage:entity row:row];
            }
        });
    });
}

@end
