//
//  ViewController.m
//  StrokeStart与StrokeEnd动画
//
//  Created by RinpeChen on 16/1/21.
//  Copyright © 2016年 miaoqu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) CAShapeLayer *shapeLayer;          // 形状图层
@property (nonatomic, strong) NSTimer *timer;                    // 定时器
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
    
    // 创建圆形贝塞尔曲线
    UIBezierPath *circle = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 200, 200)];
    
    self.shapeLayer             = [CAShapeLayer layer];                 // 创建形状图层
    self.shapeLayer.frame       = CGRectMake(0, 0, 200, 200);           // 设置尺寸
    self.shapeLayer.position    = self.view.center;                     // 设置位置
    self.shapeLayer.fillColor   = [UIColor whiteColor].CGColor;         // 设置填充颜色
    self.shapeLayer.lineWidth   = 5.f;                                 // 设置路径线条宽度
    self.shapeLayer.strokeColor = [UIColor redColor].CGColor;           // 设置路径颜色

    // 设置路径起点和终点
    self.shapeLayer.strokeStart = 0;
    self.shapeLayer.strokeEnd = 0;
    
    // 产生关联
    self.shapeLayer.path = circle.CGPath;
    
    [self.view.layer addSublayer:self.shapeLayer];
    
    // 创建定时器
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.f
                                              target:self
                                            selector:@selector(getAnimation)
                                            userInfo:nil
                                             repeats:YES];
}

- (void)getAnimation
{
    // 注意, strokeEnd的值一定要比strokeStart大, 不然不会显示出来
    CGFloat valueOne = arc4random() % 100 / 100.f;
    CGFloat valueTwo = arc4random() % 100 / 100.f;
    
    // 通过改变strokeStart和strokeEnd来实现动画
    self.shapeLayer.strokeEnd   = valueOne > valueTwo ? valueOne : valueTwo;
    self.shapeLayer.strokeStart = valueTwo < valueOne ? valueTwo : valueOne;
}

@end
