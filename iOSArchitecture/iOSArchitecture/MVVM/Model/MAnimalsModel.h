//
//  MAnimalModel.h
//  iOSArchitecture
//
//  Created by peace on 2018/9/12.
//  Copyright © 2018 peace. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MAnimalModel.h"
@protocol MAnimalModelDelegate;

@interface MAnimalsModel : NSObject

@property (nonatomic,weak) id<MAnimalModelDelegate> delegate;
@property (nonatomic,strong) NSArray <MAnimalModel*>*dataSource;

- (void)downloadImageWtihModel:(MAnimalModel *)animalModel;

@end

@protocol MAnimalModelDelegate<NSObject>
- (void)animalShowImage:(MAnimalModel *)animalModel row:(NSInteger)row;
@end
