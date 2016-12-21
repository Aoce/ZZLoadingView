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

@property (nonatomic, assign) CGFloat eyeRadius;

@property (nonatomic, assign) CGFloat eyeBallRadius;

@property (nonatomic, assign) CGFloat faceLineWidth;

/* 眼睛线条的宽度 */
@property (nonatomic, assign) CGFloat eyeCircleLineWidth;

/* 眼睛中心距离眼球中心在垂直方向的y值 */
@property (nonatomic, assign) CGFloat eyeBallDistance;

/* 圆脸中心距离眼镜中心在垂直方向的y值 */
@property (nonatomic, assign) CGFloat eyeFaceDistance;

- (void)drawLayers;

@end
