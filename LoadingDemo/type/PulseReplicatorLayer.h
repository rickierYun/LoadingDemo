//
//  PulseReplicatorLayer.h
//  LoadingDemo
//
//  Created by 欧阳云慧 on 2017/10/12.
//  Copyright © 2017年 欧阳云慧. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PulseReplicatorLayer : UIView
- (id) initWithFrame:(CGRect)frame withColor:(UIColor *)color;
- (void) startToPulse;
@end
