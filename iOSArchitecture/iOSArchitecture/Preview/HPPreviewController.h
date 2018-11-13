//
//  HPPreviewController.h
//  iOSArchitecture
//
//  Created by peace on 2018/11/13.
//  Copyright © 2018 peace. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <QuickLook/QuickLook.h>

NS_ASSUME_NONNULL_BEGIN

@interface HPPreviewController : QLPreviewController

@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *path;

@end

@interface QLPreviewItemCustom : NSObject <QLPreviewItem>
- (id) initWithTitle:(NSString*)title url:(NSURL*)url;
@end

NS_ASSUME_NONNULL_END
