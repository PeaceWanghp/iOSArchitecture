//
//  AnimalModel.h
//  iOSArchitecture
//
//  Created by peace on 2018/9/10.
//  Copyright © 2018 peace. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AnimalEntity.h"

@protocol AnimalModelDelegate;

@interface AnimalModel : NSObject

@property (nonatomic,weak) id<AnimalModelDelegate> delegate;
@property (nonatomic,strong,readonly) NSArray *dataSource;

- (AnimalEntity *)animalEntityWitIndexPath:(NSInteger)row;

@end

@protocol AnimalModelDelegate<NSObject>
- (void)animalShowImage:(AnimalEntity *)entity row:(NSInteger)row;
@end
