//
//  ZZLoadingView.h
//  ZZLoadingView
//
//  Created by Ace on 16/12/20.
//  Copyright © 2016年 Ace. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZZLoadingView : UIView

/* 动画转动一圈的时长 */
@property (nonatomic, assign) CFTimeInterval duration;

/* 缺口弧度 */
@property (nonatomic, assign) CGFloat gapRadian;

/* 眼睛半径 */
@property (nonatomic, assign) CGFloat eyeRadius;

/* 眼球半径 */
@property (nonatomic, assign) CGFloat eyeBallRadius;

/* 脸部圆圈线宽 */
@property (nonatomic, assign) CGFloat faceLineWidth;

/* 眼睛线条的宽度 */
@property (nonatomic, assign) CGFloat eyeCircleLineWidth;

/* 眼睛中心距离眼球中心在垂直方向的y值 */
@property (nonatomic, assign) CGFloat eyeBallDistance;

/* 圆脸中心距离眼镜中心在垂直方向的y值 */
@property (nonatomic, assign) CGFloat eyeFaceDistance;

/* 默认颜色 */
@property (nonatomic, strong) UIColor *tintColor;

- (void)showInView:(UIView *)view;
- (void)pause;
- (void)resume;
- (void)stop;

@end
