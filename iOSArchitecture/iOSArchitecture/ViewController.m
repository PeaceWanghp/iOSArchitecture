//
//  ViewController.m
//  iOSArchitecture
//
//  Created by peace on 2018/9/10.
//  Copyright © 2018 peace. All rights reserved.
//

#import "ViewController.h"

#import "DiskManagementTableViewController.h"


@interface ViewController ()

@end

@implementation ViewController

#pragma mark -
#pragma mark -- Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.model appendOpenedHeader:@"架构："];
    [self.model appendDarkItemWithTitle:@"架构是系统的顶层结构" class:[UIViewController class]];
    [self.model appendDarkItemWithTitle:@"架构设计：架构 = 模块 + 交互" class:[UIViewController class]];
    [self.model appendDarkItemWithTitle:@"架构设计的目的一：为了隔离关注点，降低复杂度" class:[UIViewController class]];
    [self.model appendDarkItemWithTitle:@"架构设计的目的二：为了更好的分工合作" class:[UIViewController class]];
    [self.model appendDarkItemWithTitle:@"架构设计的任务是：划分模块，设计模块的交互方式" class:[UIViewController class]];
    [self.model appendDarkItemWithTitle:@"架构设计的指导思想就是面向对象的思想" class:[UIViewController class]];
    
    [self.model appendOpenedHeader:@"架构设计流程："];
    [self.model appendDarkItemWithTitle:@"业务架构(来源于客户需求)\n->\n领域架构(按“功能需求”提炼领域架构关系图)\n->\n软件架构(一、按“功能需求”直接映射xx子系统，二、按“质量需求”进一步细化各个子系统)"
                                  class:[UIViewController class]];
    [self.model appendDarkItemWithTitle:@"业务需求：分为“功能需求”和“质量需求”"
                                  class:[UIViewController class]];
    [self.model appendDarkItemWithTitle:@"架构设计第一难点是：评估架构方案，可采用“综合/360度评估”的方式"
                                  class:[UIViewController class]];
    [self.model appendDarkItemWithTitle:@"架构设计第二难点是：选择架构方案，可采用“按优先级选择”的方式"
                                  class:[UIViewController class]];
    
    [self.model appendOpenedHeader:@"架构设计技巧："];
    [self.model appendDarkItemWithTitle:@"架构设计原则：“客户需求优先原则”和“适当超前原则”" class:[UIViewController class]];
    [self.model appendDarkItemWithTitle:@"“拆”是架构设计的屠龙刀，拆完后“合”才能提供完整的业务" class:[UIViewController class]];
    [self.model appendDarkItemWithTitle:@"拆的手段有：拆系统、拆模块、拆类、拆方法" class:[UIViewController class]];
    [self.model appendDarkItemWithTitle:@"合的手段有：中介者、依赖、组合" class:[UIViewController class]];
}

@end
