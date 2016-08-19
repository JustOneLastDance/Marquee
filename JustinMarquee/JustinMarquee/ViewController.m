//
//  ViewController.m
//  JustinMarquee
//
//  Created by JustinChou on 16/8/19.
//  Copyright © 2016年 JustinChou. All rights reserved.
//

#import "ViewController.h"
#import "Marquee/Marquee.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat x =[UIScreen mainScreen].bounds.size.width * 0.25;
    
    Marquee *marquee = [[Marquee alloc] initWithFrame:CGRectMake(x, 100, [UIScreen mainScreen].bounds.size.width * 0.5, 20)];
    marquee.backgroundColor = [UIColor greenColor];
    [self.view addSubview:marquee];
    
    NSArray *arr = @[@"锄禾日当午！！！！！", @"asd g sadf d ass adsf", @"asd你是来发神经地方", @"adfadf"];
    marquee.resourceArray = arr;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
