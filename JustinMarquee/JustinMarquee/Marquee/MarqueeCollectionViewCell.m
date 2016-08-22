//
//  MarqueeCollectionViewCell.m
//  JustinMarquee
//
//  Created by JustinChou on 16/8/19.
//  Copyright © 2016年 JustinChou. All rights reserved.
//

#import "MarqueeCollectionViewCell.h"

@interface MarqueeCollectionViewCell ()

@end

@implementation MarqueeCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.textLabel = [[UILabel alloc] initWithFrame:self.bounds];
        self.textLabel.userInteractionEnabled = true;
        [self.contentView addSubview:self.textLabel];
    }
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture)];
    [self.textLabel addGestureRecognizer:tapGesture];
    
    return self;
}

- (void)tapGesture {
    if ([_delegate respondsToSelector:@selector(didClickTextLabelWithString:)]) {
        [_delegate didClickTextLabelWithString:self.textLabelStr];
    }
}

- (void)setTextLabelStr:(NSString *)textLabelStr {
    _textLabelStr = textLabelStr;
    [self.textLabel setText:textLabelStr];
    if (textLabelStr == nil) {
        [self.textLabel setText:@"text"];
    }
}

@end
