//
//  GridReplicatorLayer.m
//  LoadingDemo
//
//  Created by 欧阳云慧 on 2017/10/12.
//  Copyright © 2017年 欧阳云慧. All rights reserved.
//

#import "GridReplicatorLayer.h"
@interface GridReplicatorLayer()
@property (nonatomic, strong)CAShapeLayer *dot;
@end

@implementation GridReplicatorLayer

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}

- (void)setUp {
    CGFloat nbColum = 3.0;
    CGFloat marginBetweenDot = 5.0f;
    CGFloat size = self.layer.bounds.size.width;
    CGFloat dotsize = (size - (marginBetweenDot * (nbColum - 1))) / nbColum;

    _dot = [[CAShapeLayer alloc]init];
    _dot.frame = CGRectMake(0, 0, dotsize, dotsize);
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, dotsize, dotsize)];
    _dot.path  = path.CGPath;
    _dot.fillColor = [UIColor redColor].CGColor;

    CAReplicatorLayer *replicatorX = [[CAReplicatorLayer alloc]init];
    replicatorX.frame = CGRectMake(0, 0, size, size);
    replicatorX.instanceCount = 3;
    replicatorX.instanceDelay = 0.5;

    CATransform3D transform = CATransform3DTranslate(CATransform3DIdentity, dotsize + marginBetweenDot, 0, 0.0);
    replicatorX.instanceTransform = transform;
    transform = CATransform3DScale(CATransform3DIdentity, 1, -1, 0);

    CAReplicatorLayer *replicatorY = [[CAReplicatorLayer alloc]init];
    replicatorY.frame = CGRectMake(0, 0, size, size);
    replicatorY.instanceDelay = 0.5;
    replicatorY.instanceCount = 3;

    CATransform3D transformY = CATransform3DTranslate(CATransform3DIdentity, dotsize + marginBetweenDot, 0, 0.0);
    replicatorY.instanceTransform = transformY;

    [replicatorX addSublayer:_dot];
    [replicatorY addSublayer:replicatorX];
    [self.layer addSublayer:replicatorY];

}

- (void)start {
    CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
    groupAnimation.animations = @[[self alphaAnimation],[self scaleAnimation]];
    groupAnimation.duration  = 1.5;                                         // instanceCount * instanceDelay
    groupAnimation.autoreverses = true;
    groupAnimation.repeatCount = CGFLOAT_MAX;
    [self.dot addAnimation:groupAnimation forKey:@"groupAnimation"];
}

// 透明动画
- (CABasicAnimation *)alphaAnimation {
    CABasicAnimation *alphaAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    alphaAnimation.fromValue = [NSNumber numberWithFloat:0.3];
    alphaAnimation.toValue   = @(0.0);
    return alphaAnimation;
}

// 翻转动画
- (CABasicAnimation *)scaleAnimation {
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
    CATransform3D t1 = CATransform3DScale(CATransform3DIdentity, 1.0, 1.0, 0.0);
    CATransform3D t2 = CATransform3DScale(CATransform3DIdentity, 0.2, 0.2, 0.0);
    scaleAnimation.fromValue = [NSValue valueWithCATransform3D:t1];
    scaleAnimation.toValue   = [NSValue valueWithCATransform3D:t2];
    return scaleAnimation;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
