//
//  MarqueeCollectionViewCell.h
//  JustinMarquee
//
//  Created by JustinChou on 16/8/19.
//  Copyright © 2016年 JustinChou. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MarqueeCollectionViewCellDelegate <NSObject>

- (void)didClickTextLabelWithString:(NSString *)str;

@end

@interface MarqueeCollectionViewCell : UICollectionViewCell
/**
 *  显示的文本内容
 */
@property (nonatomic, copy) NSString *textLabelStr;

@property (nonatomic, weak) id<MarqueeCollectionViewCellDelegate> delegate;

@property (nonatomic, strong) UILabel *textLabel;

@end
