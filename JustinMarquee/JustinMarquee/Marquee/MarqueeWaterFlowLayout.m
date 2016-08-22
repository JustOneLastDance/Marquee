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
    
    
    self.minimumLineSpacing = 10;
    self.minimumInteritemSpacing = 10;
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self.collectionView.showsHorizontalScrollIndicator = false;
    
    [super prepareLayout];
    
}

@end
