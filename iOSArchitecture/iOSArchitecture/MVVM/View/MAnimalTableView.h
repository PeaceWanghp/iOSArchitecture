//
//  MAnimalTableView.h
//  iOSArchitecture
//
//  Created by peace on 2018/9/12.
//  Copyright © 2018 peace. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MAnimalsViewModel.h"

@interface MAnimalTableView : UITableView

@property (nonatomic,strong) MAnimalsViewModel *viewModel;

- (void)refreshData;

@end
