//
//  DotsFileReplicatorLayer.m
//  LoadingDemo
//
//  Created by 欧阳云慧 on 2017/10/12.
//  Copyright © 2017年 欧阳云慧. All rights reserved.
//

#import "DotsFileReplicatorLayer.h"
@interface DotsFileReplicatorLayer()
@property (nonatomic, strong)CAShapeLayer *dot;
@end

@implementation DotsFileReplicatorLayer


- (id)initWithFrame:(CGRect)frame withColor:(UIColor *)color {
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}

- (void)setUp {
    CGFloat marginBetweenDot = 5.0f;
    CGFloat size = self.layer.bounds.size.width;
    CGFloat dotsize = (size - 2*marginBetweenDot) / 3;

    _dot = [[CAShapeLayer alloc]init];
    _dot.frame = CGRectMake(0,(size - dotsize) / 2,dotsize,dotsize);
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, dotsize, dotsize)];
    _dot.path = path.CGPath;
    _dot.fillColor = [UIColor redColor].CGColor;

    CAReplicatorLayer *replicatorLayer = [[CAReplicatorLayer alloc]init];
    replicatorLayer.frame = CGRectMake(0, 0, dotsize, dotsize);
    replicatorLayer.instanceCount = 3;
    replicatorLayer.instanceDelay = 1;
    replicatorLayer.instanceTransform = CATransform3DMakeTranslation(marginBetweenDot + dotsize, 0, 0);

    [replicatorLayer addSublayer:_dot];
    [self.layer addSublayer:replicatorLayer];
}

- (void)start {
    CAAnimationGroup *animation = [CAAnimationGroup animation];
    animation.animations = @[[self flipAnimation]];
    animation.duration = 3;
    animation.autoreverses = NO;
    animation.repeatCount  = CGFLOAT_MAX;
    [self.dot addAnimation: animation forKey:@"scaleAnimation"];

}

- (CABasicAnimation *)flipAnimation {
    CABasicAnimation *scaleAnim = [CABasicAnimation animationWithKeyPath:@"transform"];

    CATransform3D t1 = CATransform3DRotate(CATransform3DIdentity, 0.0, 0.0, 1.0, 0.0);
    CATransform3D t2 = CATransform3DRotate(CATransform3DIdentity, M_PI, 0.0, 1.0, 0.0);

    scaleAnim.fromValue = [NSValue valueWithCATransform3D:t1];
    scaleAnim.toValue   = [NSValue valueWithCATransform3D:t2];
    return scaleAnim;
}
@end
