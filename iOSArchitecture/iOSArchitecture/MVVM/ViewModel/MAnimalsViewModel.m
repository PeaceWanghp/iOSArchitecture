//
//  MAnimalViewModel.m
//  iOSArchitecture
//
//  Created by peace on 2018/9/12.
//  Copyright © 2018 peace. All rights reserved.
//

#import "MAnimalsViewModel.h"

#import "MAnimalsModel.h"

@interface MAnimalsViewModel()<MAnimalModelDelegate>
@property (nonatomic,strong) MAnimalsModel *animalsModel;
@end

@implementation MAnimalsViewModel

- (instancetype)init {
    self = [super init];
    if (self) {
        _animalsModel = [[MAnimalsModel alloc] init];
        _animalsModel.delegate = self;
        
        [self reloadData];
    }
    return self;
}

- (void)dealloc {
    NSLog(@"%s",__func__);
}

- (MAnimalViewModel *)animalEntityWitIndexPath:(NSInteger)row {
    MAnimalViewModel *viewModel = [_dataSource objectAtIndex:row];
    
    if (_animalsModel.dataSource.count > row) {
        MAnimalModel *model = [_animalsModel.dataSource objectAtIndex:row];
        [_animalsModel downloadImageWtihModel:model];
    }
    
    return viewModel;
}

- (void)animalShowImage:(MAnimalModel *)animalModel row:(NSInteger)row {
    MAnimalViewModel *viewModel = [_dataSource objectAtIndex:row];
    viewModel.imageData = animalModel.imageData;
    
    if (_delegate && [_delegate respondsToSelector:@selector(viewModel:reloadRow:)]) {
        [_delegate viewModel:self reloadRow:row];
    }
}

- (void)deleteWithRow:(NSInteger)row {
    [_dataSource removeObjectAtIndex:row];
}

- (void)reloadData {
    MAnimalViewModel *vieweModel = nil;
    
    NSMutableArray *mutableArray = [NSMutableArray array];
    for (MAnimalViewModel *eachViewModel in _animalsModel.dataSource) {
        vieweModel = [[MAnimalViewModel alloc] init];
        vieweModel.identifier = eachViewModel.identifier;
        vieweModel.imageData = eachViewModel.imageData;
        vieweModel.name = eachViewModel.name;
        vieweModel.summary = eachViewModel.summary;
        [mutableArray addObject:vieweModel];
    }
    
    _dataSource = mutableArray;
    
    if (_delegate && [_delegate respondsToSelector:@selector(reloadDataWithViewModel:)]) {
        [_delegate reloadDataWithViewModel:self];
    }
}

@end
