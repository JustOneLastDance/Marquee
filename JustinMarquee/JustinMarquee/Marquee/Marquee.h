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
 *  resource array
 */
@property (nonatomic, strong) NSArray *resourceArray;
/**
 *  cell's delegate
 */
@property (nonatomic, weak) id delegate;
/**
 *  the speed of the rolling
 *  1～10 default 5 math smaller the speed slower
 */
@property (nonatomic, assign) CGFloat scrollSpeed;

- (void)startMarquee;

- (void)stopMarquee;

@end
