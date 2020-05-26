//
//  MAnimalViewModel.h
//  iOSArchitecture
//
//  Created by peace on 2018/9/12.
//  Copyright © 2018 peace. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MAnimalViewModel.h"
@protocol MAnimalViewModelDelegate;

@interface MAnimalsViewModel : NSObject

@property (nonatomic,weak) id<MAnimalViewModelDelegate> delegate;
@property (nonatomic,strong,readonly) NSMutableArray <MAnimalViewModel*>*dataSource;

- (MAnimalViewModel *)animalEntityWitIndexPath:(NSInteger)row;
- (void)deleteWithRow:(NSInteger)row;
- (void)reloadData;

@end

@protocol MAnimalViewModelDelegate<NSObject>
- (void)viewModel:(MAnimalsViewModel *)viewModel reloadRow:(NSInteger)row;
- (void)reloadDataWithViewModel:(MAnimalsViewModel *)viewModel;
@end
