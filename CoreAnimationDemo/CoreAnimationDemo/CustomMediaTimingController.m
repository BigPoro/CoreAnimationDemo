//
//  CustomMediaTimingController.m
//  CoreAnimationDemo
//
//  Created by iDog on 2022/9/14.
//

#import "CustomMediaTimingController.h"
@interface CustomMediaTimingController ()
@property (nonatomic, strong) UIView *layerView;
@end

@implementation CustomMediaTimingController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;

    [self drawMediaTimingFunction];
}

- (void)drawMediaTimingFunction {
    UIView *layerView = [UIView new];
    layerView.backgroundColor = UIColor.lightGrayColor;
    layerView.frame = CGRectMake(100, 100, 200, 200);
    layerView.center = self.view.center;
    [self.view addSubview:layerView];
    
    CAMediaTimingFunction *function = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    CGPoint controlPoint1;
    CGPoint controlPoint2 ;
    [function getControlPointAtIndex:1 values:(float *)&controlPoint1];
    [function getControlPointAtIndex:2 values:(float *)&controlPoint2];

    UIBezierPath *path = [[UIBezierPath alloc] init];
    [path moveToPoint:CGPointZero];
    [path addCurveToPoint:CGPointMake(1, 1)
            controlPoint1:controlPoint1 controlPoint2:controlPoint2];
    [path applyTransform:CGAffineTransformMakeScale(200, 200)];

    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.strokeColor = [UIColor redColor].CGColor;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.lineWidth = 4.0f;
    shapeLayer.path = path.CGPath;
    [layerView.layer addSublayer:shapeLayer];
    // 翻转坐标系 从左下角开始
    layerView.layer.geometryFlipped = YES;
}

@end
