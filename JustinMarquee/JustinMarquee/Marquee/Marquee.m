//
//  Marquee.m
//  JustinMarquee
//
//  Created by JustinChou on 16/8/19.
//  Copyright © 2016年 JustinChou. All rights reserved.
//

#import "Marquee.h"
#import "MarqueeWaterFlowLayout.h"


#define kMarqueeCollectionViewCell @"kMarqueeCollectionViewCell"
static const CGFloat kMarqueeSpeedUnit = 0.0005;

@interface Marquee ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) NSMutableArray *itemWidthArray;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, assign) CGFloat currentX;

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
        self.currentX = 0.0f;
        
        MarqueeWaterFlowLayout *layout = [[MarqueeWaterFlowLayout alloc] init];
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height) collectionViewLayout:layout];
        self.collectionView = collectionView;
        collectionView.backgroundColor = [UIColor clearColor];
        
        [collectionView registerClass:[MarqueeCollectionViewCell class] forCellWithReuseIdentifier:kMarqueeCollectionViewCell];
        collectionView.showsHorizontalScrollIndicator = false;
        collectionView.delegate = self;
        collectionView.dataSource = self;
        [self addSubview:collectionView];
        //默认速度
        self.scrollSpeed = 5 * kMarqueeSpeedUnit;
        
    }
    return self;
}

#pragma mark - getter & setter

- (void)setScrollSpeed:(CGFloat)scrollSpeed {
    _scrollSpeed = scrollSpeed;
    _scrollSpeed = _scrollSpeed * kMarqueeSpeedUnit;
}

- (void)setResourceArray:(NSArray *)resourceArray {
    _resourceArray = resourceArray;
    
    [_itemWidthArray removeAllObjects];
    for (NSString *str in resourceArray) {
        UILabel *label = [[UILabel alloc] init];
        [label setText:str];
        [label sizeToFit];
        [self.itemWidthArray addObject:@(label.frame.size.width)];
    }
    
    [NSTimer scheduledTimerWithTimeInterval:1/60 target:self selector:@selector(pxy_autoScrollCollectionView) userInfo:nil  repeats:true];
    
}

#pragma mark - delegate & datasource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    // 假象无限轮播 利用 cell 的重用
    return self.resourceArray.count * (self.resourceArray.count <= 2 ? 2 : 1000);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MarqueeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kMarqueeCollectionViewCell forIndexPath:indexPath];
    cell.contentView.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1.0];
    cell.textLabelStr = self.resourceArray[indexPath.item % self.resourceArray.count];
    cell.delegate = self.delegate;
    
    [cell.textLabel sizeToFit];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGSize itemSize = CGSizeMake([self.itemWidthArray[indexPath.item % self.resourceArray.count] floatValue], 20);
    return itemSize;
}

#pragma mark - other function
- (void)pxy_autoScrollCollectionView {
    
    CGFloat totalcontentWidth = 0.0f;
    for (NSNumber *numWidth in _itemWidthArray) {
        totalcontentWidth = [numWidth floatValue] + 10 + totalcontentWidth;
    }
    totalcontentWidth = totalcontentWidth - 10;
    
    if (self.currentX >= totalcontentWidth) {
        self.currentX = 0;
    }
    
    self.collectionView.contentOffset = CGPointMake(self.currentX, 0);
    self.currentX = self.currentX + self.scrollSpeed;
}

@end
