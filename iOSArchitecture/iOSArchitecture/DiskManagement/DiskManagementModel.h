//
//  DiskManagementModel.h
//  iOSArchitecture
//
//  Created by peace on 2018/11/6.
//  Copyright © 2018 peace. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DiskManagementModel : NSObject

- (void)loadDataCompletion:(void(^)(NSArray *items))completion;

@end

@interface DiskFile : NSObject

@property (nonatomic,copy) NSString *url;       //"/user/xxx/abc.png"
@property (nonatomic,copy) NSString *path;      //"/user/xxx"
@property (nonatomic,copy) NSString *name;      //"abc.png"
@property (nonatomic,copy) NSString *suffix;    //"png"

@property (nonatomic,assign) BOOL isDrictor;
@property (nonatomic,assign) NSInteger size;
@property (nonatomic,copy) NSString *sizeDescription;

@end

NS_ASSUME_NONNULL_END
