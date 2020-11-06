//
//  ViewModel.h
//  iOSArchitecture
//
//  Created by peace on 2018/11/6.
//  Copyright © 2018 peace. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

static NSString *const ACUIViewController = @"UIViewController";
static NSString *const ACUITableViewController = @"UITableViewController";

@interface ViewModel : NSObject

@property(nonatomic,strong) NSMutableArray *dataSource;

@end

typedef enum : NSUInteger {
    ACType_None,
    ACType_Group,
    ACType_Item,
} ACType;

@interface ACItem : NSObject

@property (nonatomic,assign) ACType type;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *subtitle;
@property (nonatomic,copy) NSString *className;
@property (nonatomic,copy) NSString *classType;

@end

NS_ASSUME_NONNULL_END
