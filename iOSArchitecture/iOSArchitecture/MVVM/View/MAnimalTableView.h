//
//  MAnimalTableView.h
//  iOSArchitecture
//
//  Created by peace on 2018/9/12.
//  Copyright © 2018 peace. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MAnimalViewModel.h"

@interface MAnimalTableView : UITableView

@property (nonatomic,strong) MAnimalViewModel *viewModel;

@end
