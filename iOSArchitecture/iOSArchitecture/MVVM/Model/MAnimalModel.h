//
//  MAnimalModel.h
//  iOSArchitecture
//
//  Created by peace on 2018/9/12.
//  Copyright © 2018 peace. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MAnimalEntity.h"
@protocol MAnimalModelDelegate;

@interface MAnimalModel : NSObject

@property (nonatomic,weak) id<MAnimalModelDelegate> delegate;
@property (nonatomic,strong) NSArray <MAnimalEntity*>*dataSource;

- (void)downloadImageWtihEntity:(MAnimalEntity *)entity;

@end

@protocol MAnimalModelDelegate<NSObject>
- (void)animalShowImage:(MAnimalEntity *)entity row:(NSInteger)row;
@end
