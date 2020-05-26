//
//  MAnimalCell.m
//  iOSArchitecture
//
//  Created by peace on 2018/9/12.
//  Copyright © 2018 peace. All rights reserved.
//

#import "MAnimalCell.h"

@implementation MAnimalCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)showImageWithData:(NSData *)data {
    if (data) {
        self.imageView.image = [UIImage imageWithData:data];
    }
}

- (void)dealloc {
    NSLog(@"%s",__func__);
}

@end
