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
    loadingView.gapRadian = (4 * M_PI)/9; //缺口80°
    loadingView.duration = 1.0;
    loadingView.eyeRadius = 31/4;
    loadingView.eyeBallRadius = 4/2;
    loadingView.faceLineWidth = 4.0f;
    loadingView.eyeBallDistance = 2.0f;
    loadingView.eyeFaceDistance = 2.0f;
    loadingView.eyeCircleLineWidth = 3.0/2;
    [loadingView drawLayers];
    [self.view addSubview:loadingView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
