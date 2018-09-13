//
//  MAnimalViewModel.h
//  iOSArchitecture
//
//  Created by peace on 2018/9/12.
//  Copyright © 2018 peace. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MAnimalViewEntity.h"
@protocol MAnimalViewModelDelegate;

@interface MAnimalViewModel : NSObject

@property (nonatomic,weak) id<MAnimalViewModelDelegate> delegate;
@property (nonatomic,strong,readonly) NSArray <MAnimalViewEntity*>*dataSource;

- (MAnimalViewEntity *)animalEntityWitIndexPath:(NSInteger)row;

@end

@protocol MAnimalViewModelDelegate<NSObject>
- (void)viewModel:(MAnimalViewModel *)viewModel reloadRow:(NSInteger)row;
@end
