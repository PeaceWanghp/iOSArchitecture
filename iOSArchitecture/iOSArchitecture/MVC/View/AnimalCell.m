//
//  AnimalCell.m
//  iOSArchitecture
//
//  Created by peace on 2018/9/10.
//  Copyright © 2018 peace. All rights reserved.
//

#import "AnimalCell.h"

@implementation AnimalCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)showImageWithData:(NSData *)data {
    UIImage *image = [UIImage imageWithData:data];
    if (image) {
        self.imageView.image = image;
    }
    else {
        image = [UIImage imageNamed:@"defaultImage"];
        self.imageView.image = image;
    }
}

@end
