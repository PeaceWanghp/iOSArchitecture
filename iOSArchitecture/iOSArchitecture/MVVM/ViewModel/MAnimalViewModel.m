//
//  MAnimalViewModel.m
//  iOSArchitecture
//
//  Created by peace on 2018/9/12.
//  Copyright © 2018 peace. All rights reserved.
//

#import "MAnimalViewModel.h"

#import "MAnimalModel.h"

@interface MAnimalViewModel()<MAnimalModelDelegate>
@property (nonatomic,strong) MAnimalModel *animalModel;
@end

@implementation MAnimalViewModel

- (instancetype)init {
    self = [super init];
    if (self) {
        _animalModel = [[MAnimalModel alloc] init];
        _animalModel.delegate = self;
        
        [self reloadData];
    }
    return self;
}

- (MAnimalViewEntity *)animalEntityWitIndexPath:(NSInteger)row {
    MAnimalViewEntity *viewEntity = [_dataSource objectAtIndex:row];
    
    if (_animalModel.dataSource.count > row) {
        MAnimalEntity *entity = [_animalModel.dataSource objectAtIndex:row];
        [_animalModel downloadImageWtihEntity:entity];
    }
    
    return viewEntity;
}

- (void)animalShowImage:(MAnimalEntity *)entity row:(NSInteger)row {
    MAnimalViewEntity *viewEntity = [_dataSource objectAtIndex:row];
    viewEntity.imageData = entity.imageData;
    
    if (_delegate && [_delegate respondsToSelector:@selector(viewModel:reloadRow:)]) {
        [_delegate viewModel:self reloadRow:row];
    }
}

- (void)deleteWithRow:(NSInteger)row {
    [_dataSource removeObjectAtIndex:row];
}

- (void)reloadData {
    MAnimalViewEntity *vieweEtity = nil;
    
    NSMutableArray *mutableArray = [NSMutableArray array];
    for (MAnimalEntity *entity in _animalModel.dataSource) {
        vieweEtity = [[MAnimalViewEntity alloc] init];
        vieweEtity.identifier = entity.identifier;
        vieweEtity.imageData = entity.imageData;
        vieweEtity.name = entity.name;
        vieweEtity.summary = entity.summary;
        [mutableArray addObject:entity];
    }
    
    _dataSource = mutableArray;
    
    if (_delegate && [_delegate respondsToSelector:@selector(reloadDataWithViewModel:)]) {
        [_delegate reloadDataWithViewModel:self];
    }
}

@end
