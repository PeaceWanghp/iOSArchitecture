//
//  MAnimalViewModel.m
//  iOSArchitecture
//
//  Created by peace on 2018/9/12.
//  Copyright © 2018 peace. All rights reserved.
//

#import "MAnimalViewModel.h"

@implementation MAnimalViewModel

- (instancetype)init {
    self = [super init];
    if (self) {
        MAnimalViewEntity *entity = nil;
        
        NSMutableArray *mutableArray = [NSMutableArray array];
        for (int i = 0; i < 10; i ++) {
            entity = [[MAnimalViewEntity alloc] init];
            entity.identifier = [[NSDate date] timeIntervalSince1970];
            entity.imageData = nil;
            entity.name = @"牛";
            entity.summary = @"牛很勤恳";
            [mutableArray addObject:entity];
        }
        
        _dataSource = mutableArray;
    }
    return self;
}

@end
