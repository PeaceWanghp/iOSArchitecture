//
//  MAanimalModel.h
//  iOSArchitecture
//
//  Created by Peace on 5/26/20.
//  Copyright © 2020 peace. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MAnimalModel : NSObject

@property (nonatomic,assign) NSInteger identifier;
@property (nonatomic,strong) NSData *imageData;
@property (nonatomic,copy) NSString *imageUrl;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *summary;
@property (nonatomic,assign) BOOL isLoading;

@end

NS_ASSUME_NONNULL_END
