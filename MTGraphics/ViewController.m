//
//  ViewController.m
//  MTGraphics
//
//  Created by mtt0150 on 15/9/8.
//  Copyright (c) 2015年 MT. All rights reserved.
//

#import "ViewController.h"
#import "MTView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //让UIview的大小和屏幕的尺寸相同
    MTView *view = [[MTView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
