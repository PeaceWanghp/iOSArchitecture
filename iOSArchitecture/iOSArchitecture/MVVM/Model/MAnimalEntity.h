//
//  MAnimalEntity.h
//  iOSArchitecture
//
//  Created by peace on 2018/9/12.
//  Copyright © 2018 peace. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MAnimalEntity : NSObject

@property (nonatomic,assign) NSInteger identifier;
@property (nonatomic,strong) NSData *imageData;
@property (nonatomic,copy) NSString *imageUrl;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *summary;
@property (nonatomic,assign) BOOL isLoading;

@end
