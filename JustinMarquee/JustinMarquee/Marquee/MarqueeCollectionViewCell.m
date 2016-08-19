//
//  MarqueeCollectionViewCell.m
//  JustinMarquee
//
//  Created by JustinChou on 16/8/19.
//  Copyright © 2016年 JustinChou. All rights reserved.
//

#import "MarqueeCollectionViewCell.h"

@interface MarqueeCollectionViewCell ()


@property (weak, nonatomic) IBOutlet UILabel *textLabel;

@end

@implementation MarqueeCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setTextStr:(NSString *)textStr {
    _textStr = textStr;
    [self.textLabel setText:textStr];
    [self.textLabel sizeToFit];
    [self.contentView addSubview:self.textLabel];
}

@end
