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
    
    CGFloat x =[UIScreen mainScreen].bounds.size.width * 0.25;
    
    Marquee *marquee = [[Marquee alloc] initWithFrame:CGRectMake(x, 100, [UIScreen mainScreen].bounds.size.width * 0.5, 20)];
    self.marquee = marquee;
    [self.view addSubview:marquee];
    
    NSArray *arr = @[@"锄禾日当午！！！！！", @"asd g sadf d ass adsf", @"asd你是来发神经地方", @"adfadf"];
    marquee.resourceArray = arr;
    marquee.delegate = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
