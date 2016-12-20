//
//  ViewController.m
//  ZZLoadingView
//
//  Created by Ace on 16/12/20.
//  Copyright © 2016年 Ace. All rights reserved.
//

#import "ViewController.h"
#import "ZZLoadingView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    ZZLoadingView *loadingView = [[ZZLoadingView alloc] initWithFrame:CGRectMake(100, 150, 43, 43)];
    [self.view addSubview:loadingView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
