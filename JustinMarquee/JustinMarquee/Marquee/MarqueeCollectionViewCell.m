//
//  MarqueeCollectionViewCell.m
//  JustinMarquee
//
//  Created by JustinChou on 16/8/19.
//  Copyright © 2016年 JustinChou. All rights reserved.
//

#import "MarqueeCollectionViewCell.h"

@interface MarqueeCollectionViewCell ()

@property (nonatomic, strong) UILabel *textLabel;

@end

@implementation MarqueeCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.textLabel = [[UILabel alloc] initWithFrame:self.bounds];
        [self.contentView addSubview:self.textLabel];
    }
    return self;
}

- (void)setTextLabelStr:(NSString *)textLabelStr {
    _textLabelStr = textLabelStr;
    [self.textLabel setText:textLabelStr];
    if (textLabelStr == nil) {
        [self.textLabel setText:@"text"];
    }
}



@end
