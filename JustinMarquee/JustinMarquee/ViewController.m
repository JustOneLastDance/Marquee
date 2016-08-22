//
//  ViewController.m
//  JustinMarquee
//
//  Created by JustinChou on 16/8/19.
//  Copyright © 2016年 JustinChou. All rights reserved.
//

#import "ViewController.h"
#import "Marquee/Marquee.h"

@interface ViewController () <MarqueeCollectionViewCellDelegate>

@property (nonatomic, strong) Marquee *marquee;

@end

@implementation ViewController

- (void)didClickTextLabelWithString:(NSString *)str {
    NSLog(@"走马灯的内容是：%@", str);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat x =[UIScreen mainScreen].bounds.size.width * 0.15;
    
    Marquee *marquee = [[Marquee alloc] initWithFrame:CGRectMake(x, 100, [UIScreen mainScreen].bounds.size.width * 0.7, 30)];
    self.marquee = marquee;
    self.marquee.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:marquee];
    
    NSArray *arr = @[@"寻寻觅觅，冷冷清清，凄凄惨惨戚戚。", @"乍暖还寒时候，最难将息。", @"三杯两盏淡酒，怎敌他、晚来风急？", @"雁过也，正伤心，却是旧时相识。。。。。。。。。。。。。。。", @"满地黄花堆积", @"憔悴损，如今有谁堪摘？", @"守着窗儿，独自怎生得黑？", @"梧桐更兼细雨，到黄昏、点点滴滴。", @"这次第，怎一个愁字了得！"];
    NSArray *arr1 = @[@"锄禾日当午！！！！！", @"xxxxxxxxxxxxx"];
    marquee.resourceArray = arr;
    marquee.delegate = self;
    marquee.scrollSpeed = 10;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
