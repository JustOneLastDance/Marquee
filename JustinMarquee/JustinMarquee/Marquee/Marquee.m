//
//  Marquee.m
//  JustinMarquee
//
//  Created by JustinChou on 16/8/19.
//  Copyright © 2016年 JustinChou. All rights reserved.
//

#import "Marquee.h"
#import "MarqueeWaterFlowLayout.h"
#import "MarqueeCollectionViewCell.h"

@interface Marquee ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) NSMutableArray *itemWidthArray;

@end

@implementation Marquee

- (NSMutableArray *)itemWidthArray {
    if (_itemWidthArray == nil) {
        _itemWidthArray = [[NSMutableArray alloc] init];
    }
    return _itemWidthArray;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        MarqueeWaterFlowLayout *layout = [[MarqueeWaterFlowLayout alloc] init];
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height) collectionViewLayout:layout];
        collectionView.backgroundColor = [UIColor yellowColor];
        
        [collectionView registerClass:[MarqueeCollectionViewCell class] forCellWithReuseIdentifier:@"cellId"];
        collectionView.showsHorizontalScrollIndicator = false;
        collectionView.delegate = self;
        collectionView.dataSource = self;
        [self addSubview:collectionView];
    }
    return self;
}

#pragma mark - getter & setter
- (void)setResourceArray:(NSArray *)resourceArray {
    _resourceArray = resourceArray;
    
    [_itemWidthArray removeAllObjects];
    for (NSString *str in resourceArray) {
        UILabel *label = [[UILabel alloc] init];
        [label setText:str];
        [label sizeToFit];
        
        [self.itemWidthArray addObject:@(label.frame.size.width)];
    }
    
    NSLog(@"%@", self.itemWidthArray);
    
}
#pragma mark - delegate & datasource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.resourceArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    MarqueeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellId" forIndexPath:indexPath];
    cell.contentView.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1.0];
    cell.textStr = self.resourceArray[indexPath.row];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CGSize itemSize = CGSizeMake([self.itemWidthArray[indexPath.row] floatValue], 20);
    return itemSize;
    
}

@end
