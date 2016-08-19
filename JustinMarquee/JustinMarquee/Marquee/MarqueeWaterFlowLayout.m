//
//  MarqueeWaterFlowLayout.m
//  JustinMarquee
//
//  Created by JustinChou on 16/8/19.
//  Copyright © 2016年 JustinChou. All rights reserved.
//

#import "MarqueeWaterFlowLayout.h"

@implementation MarqueeWaterFlowLayout

- (void)prepareLayout {
    
    [super prepareLayout];
    
    self.minimumLineSpacing = 0;
    self.minimumInteritemSpacing = 10;
//    self.estimatedItemSize = CGSizeMake(100, 20);
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
}

@end
