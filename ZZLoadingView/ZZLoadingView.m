//
//  ZZLoadingView.m
//  ZZLoadingView
//
//  Created by Ace on 16/12/20.
//  Copyright © 2016年 Ace. All rights reserved.
//

#import "ZZLoadingView.h"

@interface ZZLoadingView ()

@property (nonatomic, strong) CAShapeLayer *circleLayer;
@property (nonatomic, strong) CAShapeLayer *lefteyeLayer;
@property (nonatomic, strong) CAShapeLayer *righteyeLayer;

@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat width;

@end

@implementation ZZLoadingView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.width = frame.size.width;
        self.height = frame.size.height;
        
        [self drawLefteyeLayer];
        [self drawRighteyeLayer];
        [self drawCircleLayer];
        [self startAnimation];
    }
    return self;
}

- (void)drawCircleLayer {
    CGPoint center = CGPointMake(self.width/2, self.height/2);
    CGFloat radius = self.width/2 - 2;
    CGFloat startAngle = (2 * M_PI)/9 - M_PI_2; //-40°
    CGFloat endAngele  = 3 * M_PI_2 - (2 * M_PI)/9;
    CAShapeLayer *circleLayer = [CAShapeLayer layer];
    circleLayer.frame = self.bounds;
    circleLayer.anchorPoint = CGPointMake(0.5, 0.5);
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startAngle endAngle:endAngele clockwise:YES];
    circleLayer.lineWidth = 4.0f;
    circleLayer.path = path.CGPath;
    circleLayer.strokeColor = [UIColor brownColor].CGColor;
    circleLayer.fillColor = [UIColor clearColor].CGColor;
    
    self.circleLayer = circleLayer;
    [self.layer addSublayer:circleLayer];
    
}

- (void)drawLefteyeLayer {
    CGFloat radius = 31/4;
    CGPoint center = CGPointMake(self.width/2 - radius, self.height/2-2);
    CAShapeLayer *lefteyeLayer = [CAShapeLayer layer];
    lefteyeLayer.frame = self.bounds;
    lefteyeLayer.position = center;
    lefteyeLayer.anchorPoint = CGPointMake(center.x/self.width, center.y/self.height);
    CAShapeLayer *lefteyeCircleLayer = [CAShapeLayer layer];
    UIBezierPath *eyeCirclePath = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:0 endAngle:2 * M_PI clockwise:YES];
    lefteyeCircleLayer.lineWidth = 3.0f/2;
    lefteyeCircleLayer.path = eyeCirclePath.CGPath;
    lefteyeCircleLayer.strokeColor = [UIColor brownColor].CGColor;
    lefteyeCircleLayer.fillColor = [UIColor clearColor].CGColor;
    
    CAShapeLayer *lefteyeBallLayer = [CAShapeLayer layer];
    center = CGPointMake(center.x, center.y - radius + 2);
    radius = 2;
    UIBezierPath *eyeBallPath = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:0 endAngle:2 * M_PI clockwise:YES];
    lefteyeBallLayer.path = eyeBallPath.CGPath;
    lefteyeBallLayer.fillColor = [UIColor brownColor].CGColor;
    
    [lefteyeCircleLayer addSublayer:lefteyeBallLayer];
    [lefteyeLayer addSublayer:lefteyeCircleLayer];
    [self.layer addSublayer:lefteyeLayer];
    
    self.lefteyeLayer = lefteyeLayer;
}

- (void)drawRighteyeLayer {
    CGFloat radius = 31/4;
    CGPoint center = CGPointMake(self.width/2 + radius, self.height/2-2);
    CAShapeLayer *righteyeLayer = [CAShapeLayer layer];
    righteyeLayer.frame = self.bounds;
    righteyeLayer.position = center;
    righteyeLayer.anchorPoint = CGPointMake(center.x/self.width, center.y/self.height);
    CAShapeLayer *righteyeCircleLayer = [CAShapeLayer layer];
    UIBezierPath *eyeCirclePath = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:0 endAngle:2 * M_PI clockwise:YES];
    righteyeCircleLayer.lineWidth = 3.0f/2;
    righteyeCircleLayer.path = eyeCirclePath.CGPath;
    righteyeCircleLayer.strokeColor = [UIColor brownColor].CGColor;
    righteyeCircleLayer.fillColor = [UIColor clearColor].CGColor;
    
    CAShapeLayer *righteyeBallLayer = [CAShapeLayer layer];
    center = CGPointMake(center.x, center.y - radius + 2);
    radius = 2;
    UIBezierPath *eyeBallPath = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:0 endAngle:2 * M_PI clockwise:YES];
    righteyeBallLayer.path = eyeBallPath.CGPath;
    righteyeBallLayer.fillColor = [UIColor brownColor].CGColor;
    
    [righteyeCircleLayer addSublayer:righteyeBallLayer];
    [righteyeLayer addSublayer:righteyeCircleLayer];
    [self.layer addSublayer:righteyeLayer];
    
    self.righteyeLayer = righteyeLayer;
    
}

- (void)startAnimation {
    CAAnimation *animation = [self.circleLayer animationForKey:@"rotationZAnimation"];
    if (animation) {
        return;
    }
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = @(M_PI * 2.0);
    rotationAnimation.duration = 1;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = HUGE_VALF;
    rotationAnimation.removedOnCompletion = NO;
    rotationAnimation.fillMode = kCAFillModeForwards;
    rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [self.circleLayer addAnimation:rotationAnimation forKey:@"rotationZAnimation"];
    [self.lefteyeLayer addAnimation:rotationAnimation forKey:@"rotationZAnimation"];
    [self.righteyeLayer addAnimation:rotationAnimation forKey:@"rotationZAnimation"];
}

@end
