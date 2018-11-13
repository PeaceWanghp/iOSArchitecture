//
//  HPPreviewController.m
//  iOSArchitecture
//
//  Created by peace on 2018/11/13.
//  Copyright © 2018 peace. All rights reserved.
//

#import "HPPreviewController.h"

@interface HPPreviewController ()<QLPreviewControllerDelegate,QLPreviewControllerDataSource>
{
    QLPreviewItemCustom *_previewItem;
}

@end

@implementation HPPreviewController

#pragma mark -
#pragma mark -- Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.dataSource = self;
    self.delegate = self;
    
    _previewItem = [[QLPreviewItemCustom alloc] initWithTitle:_name url:[NSURL fileURLWithPath:_path]];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    NSLog(@"%s",__func__);
}

#pragma mark -
#pragma mark -- QLPreview
- (NSInteger)numberOfPreviewItemsInPreviewController:(QLPreviewController *)controller {
    return 1;
}

- (id<QLPreviewItem>)previewController:(QLPreviewController *)controller previewItemAtIndex:(NSInteger)index {
    
    return _previewItem;
}

@end

@implementation QLPreviewItemCustom

@synthesize previewItemTitle = _previewItemTitle;
@synthesize previewItemURL = _previewItemURL;

- (id) initWithTitle:(NSString*)title url:(NSURL*)url {
    self = [super init];
    if (self) {
        _previewItemTitle = title;
        _previewItemURL = url;
    }
    return self;
}

@end

