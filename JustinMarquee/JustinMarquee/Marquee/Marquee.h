//
//  Marquee.h
//  JustinMarquee
//
//  Created by JustinChou on 16/8/19.
//  Copyright © 2016年 JustinChou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MarqueeCollectionViewCell.h"

@interface Marquee : UIView
/**
 *  需要显示的内容数组
 */
@property (nonatomic, strong) NSArray *resourceArray;
/**
 *  cell的代理传递
 */
@property (nonatomic, weak) id delegate;

@end
