//
//  ViewController.m
//  LoadingDemo
//
//  Created by 欧阳云慧 on 2017/10/12.
//  Copyright © 2017年 欧阳云慧. All rights reserved.
//

#import "ViewController.h"
#import "PulseReplicatorLayer.h"
#import "DotsFileReplicatorLayer.h"
#import "GridReplicatorLayer.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    PulseReplicatorLayer *pulseLoad = [[PulseReplicatorLayer alloc]initWithFrame:CGRectMake(0, 0, 50, 50) withColor:[UIColor redColor]];
    pulseLoad.center = self.view.center;
    [self.view addSubview:pulseLoad];

    [pulseLoad startToPulse];

    DotsFileReplicatorLayer *dot = [[DotsFileReplicatorLayer alloc]initWithFrame:CGRectMake(0, 0, 50, 50) withColor:[UIColor redColor]];
    [self.view addSubview:dot];
    [dot start];

    GridReplicatorLayer *grid = [[GridReplicatorLayer alloc]initWithFrame:CGRectMake(self.view.bounds.size.width / 3, self.view.bounds.size.height / 3, 50, 50)];
    [self.view addSubview:grid];
    [grid start];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
