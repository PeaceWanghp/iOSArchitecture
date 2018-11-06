//
//  ViewModel.m
//  iOSArchitecture
//
//  Created by peace on 2018/11/6.
//  Copyright © 2018 peace. All rights reserved.
//

#import "ViewModel.h"

@implementation ViewModel

- (instancetype)init {
    self = [super init];
    if (self) {
        _dataSource = [NSMutableArray array];
        
        ACItem *item = nil;
        
        item = [[ACItem alloc] init];
        item.title = @"MVC";
        item.subtitle = @"Model View Controller";
        item.className = @"AnimalTableViewController";
        item.classType = @"UITableViewController";
        [_dataSource addObject:item];
        
        item = [[ACItem alloc] init];
        item.title = @"MVVM";
        item.subtitle = @"Modle View ViewModel";
        item.className = @"MAnimalViewController";
        item.classType = @"UIViewController";
        [_dataSource addObject:item];
        
        item = [[ACItem alloc] init];
        item.title = @"MVVM+RAC";
        item.subtitle = @"Modle View ViewModel + RAC";
        item.className = @"MRViewController";
        item.classType = @"UIViewController";
        [_dataSource addObject:item];
        
        item = [[ACItem alloc] init];
        item.title = @"MVP";
        item.subtitle = @"Model View Presenter";
        [_dataSource addObject:item];
        
        item = [[ACItem alloc] init];
        item.title = @"VIPER";
        item.subtitle = @"View Intertactor Presenter Entity Router";
        [_dataSource addObject:item];
        
        item = [[ACItem alloc] init];
        [_dataSource addObject:item];
        
        item = [[ACItem alloc] init];
        item.title = @"Disk Management";
        item.subtitle = @"Document、Cache、tmp (NSFileManager)";
        [_dataSource addObject:item];
    }
    
    return self;
}

@end

#pragma mark -
#pragma mark -- List Item

@implementation ACItem



@end
