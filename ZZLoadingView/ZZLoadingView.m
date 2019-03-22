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

#pragma mark - Initlize

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.width = frame.size.width;
        self.height = frame.size.height;
    }
    return self;
}

#pragma mark - Private

- (void)drawCircleLayer {
    CGPoint center = CGPointMake(self.width/2, self.height/2);
    CGFloat radius = self.width/2 - self.faceLineWidth/2;
    CGFloat startAngle = self.gapRadian/2 - M_PI_2; //-40°
    CGFloat endAngele  = 3 * M_PI_2 - self.gapRadian/2;
    CAShapeLayer *circleLayer = [CAShapeLayer layer];
    circleLayer.frame = self.bounds;
    circleLayer.anchorPoint = CGPointMake(0.5, 0.5);
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startAngle endAngle:endAngele clockwise:YES];
    circleLayer.lineWidth = self.faceLineWidth;
    circleLayer.path = path.CGPath;
    circleLayer.lineCap = kCALineCapRound;
    circleLayer.strokeColor = self.tintColor.CGColor;
    circleLayer.fillColor = [UIColor clearColor].CGColor;
    
    self.circleLayer = circleLayer;
    [self.layer addSublayer:circleLayer];
    
}

- (void)drawLefteyeLayer {
    CGFloat radius = self.eyeRadius;
    CGPoint center = CGPointMake(self.width/2 - radius, self.height/2-self.eyeFaceDistance);
    CAShapeLayer *lefteyeLayer = [CAShapeLayer layer];
    lefteyeLayer.frame = self.bounds;
    lefteyeLayer.position = center;
    lefteyeLayer.anchorPoint = CGPointMake(center.x/self.width, center.y/self.height);
    CAShapeLayer *lefteyeCircleLayer = [CAShapeLayer layer];
    UIBezierPath *eyeCirclePath = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:0 endAngle:2 * M_PI clockwise:YES];
    lefteyeCircleLayer.lineWidth = self.eyeCircleLineWidth;
    lefteyeCircleLayer.path = eyeCirclePath.CGPath;
    lefteyeCircleLayer.strokeColor = self.tintColor.CGColor;
    lefteyeCircleLayer.fillColor = [UIColor clearColor].CGColor;
    
    CAShapeLayer *lefteyeBallLayer = [CAShapeLayer layer];
    center = CGPointMake(center.x, center.y - radius + self.eyeBallDistance);
    radius = self.eyeBallRadius;
    UIBezierPath *eyeBallPath = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:0 endAngle:2 * M_PI clockwise:YES];
    lefteyeBallLayer.path = eyeBallPath.CGPath;
    lefteyeBallLayer.fillColor = self.tintColor.CGColor;
    
    [lefteyeCircleLayer addSublayer:lefteyeBallLayer];
    [lefteyeLayer addSublayer:lefteyeCircleLayer];
    [self.layer addSublayer:lefteyeLayer];
    
    self.lefteyeLayer = lefteyeLayer;
}

- (void)drawRighteyeLayer {
    CGFloat radius = self.eyeRadius;
    CGPoint center = CGPointMake(self.width/2 + radius, self.height/2-self.eyeFaceDistance);
    CAShapeLayer *righteyeLayer = [CAShapeLayer layer];
    righteyeLayer.frame = self.bounds;
    righteyeLayer.position = center;
    righteyeLayer.anchorPoint = CGPointMake(center.x/self.width, center.y/self.height);
    CAShapeLayer *righteyeCircleLayer = [CAShapeLayer layer];
    UIBezierPath *eyeCirclePath = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:0 endAngle:2 * M_PI clockwise:YES];
    righteyeCircleLayer.lineWidth = self.eyeCircleLineWidth;
    righteyeCircleLayer.path = eyeCirclePath.CGPath;
    righteyeCircleLayer.strokeColor = self.tintColor.CGColor;
    righteyeCircleLayer.fillColor = [UIColor clearColor].CGColor;
    
    CAShapeLayer *righteyeBallLayer = [CAShapeLayer layer];
    center = CGPointMake(center.x, center.y - radius + self.eyeBallDistance);
    radius = self.eyeBallRadius;
    UIBezierPath *eyeBallPath = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:0 endAngle:2 * M_PI clockwise:YES];
    righteyeBallLayer.path = eyeBallPath.CGPath;
    righteyeBallLayer.fillColor = self.tintColor.CGColor;
    
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
    rotationAnimation.duration = self.duration;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = HUGE_VALF;
    rotationAnimation.removedOnCompletion = NO;
    rotationAnimation.fillMode = kCAFillModeForwards;
    rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [self.circleLayer addAnimation:rotationAnimation forKey:@"rotationZAnimation"];
    [self.lefteyeLayer addAnimation:rotationAnimation forKey:@"rotationZAnimation"];
    [self.righteyeLayer addAnimation:rotationAnimation forKey:@"rotationZAnimation"];
}

- (void)show {
    [self drawLefteyeLayer];
    [self drawRighteyeLayer];
    [self drawCircleLayer];
    [self startAnimation];
}

#pragma mark - Public

- (void)showInView:(UIView *)view {
    [view addSubview:self];
    
    [self show];
}

- (void)pause {
    CFTimeInterval pausedTime = [self.circleLayer convertTime:CACurrentMediaTime() fromLayer:nil];
    self.circleLayer.speed = 0.0f;
    self.circleLayer.timeOffset = pausedTime;
    
    self.lefteyeLayer.speed = 0.0f;
    self.lefteyeLayer.timeOffset = pausedTime;
    
    self.righteyeLayer.speed = 0.0f;
    self.righteyeLayer.timeOffset = pausedTime;
    
}

- (void)resume {
    CFTimeInterval  pausedTime = [self.circleLayer timeOffset];
    CFTimeInterval timeSincePause = [self.circleLayer convertTime:CACurrentMediaTime() fromLayer:nil] - pausedTime;
    self.circleLayer.speed = 1.0;
    self.circleLayer.beginTime = timeSincePause;
    
    self.lefteyeLayer.speed = 1.0;
    self.lefteyeLayer.beginTime = timeSincePause;
    
    self.righteyeLayer.speed = 1.0;
    self.righteyeLayer.beginTime = timeSincePause;
}

- (void)stop {
    [self.circleLayer removeAllAnimations];
    [self.lefteyeLayer removeAllAnimations];
    [self.righteyeLayer removeAllAnimations];
    
    [self removeFromSuperview];
}

@end
