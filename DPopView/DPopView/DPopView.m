//
//  DPopView.m
//  DPopView
//
//  Created by Destiny on 2019/3/13.
//  Copyright © 2019 Destiny. All rights reserved.
//

#import "DPopView.h"

#define PopScreenWidth [UIScreen mainScreen].bounds.size.width
#define PopScreenHeight [UIScreen mainScreen].bounds.size.height

@implementation DPopView

-(instancetype)init{
    self = [super init];
    if (self) {
        [self setupview];
    }
    return self;
}

- (void)setupview
{
    self.showAnimationStyle = ShowAnimationStyle_Detafult;
    self.hideAnimationStyle = HideAnimationStyle_Detafult;
    self.userTouchActionEnable = YES;
    
    self.frame = [UIScreen mainScreen].bounds;
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapCoverView)];
    [self addGestureRecognizer:tap];
}

-(void)tapCoverView{
    if (self.userTouchActionEnable) {
        [self hideContentView];
    }
}

-(void)showOnView:(UIView *)view
{
    self.contentView = view;
    view.frame = CGRectMake((PopScreenWidth-view.frame.size.width)/2, (PopScreenHeight-view.frame.size.height)/2, view.frame.size.width, view.frame.size.height);
    [self addSubview:view];
    [[[UIApplication sharedApplication] keyWindow] addSubview:self];
    
    [self showAnimation];
}

-(void)showAnimation{
    switch (self.showAnimationStyle) {
        case ShowAnimationStyle_Detafult:{
            [self.contentView.layer addAnimation:[self defaultShowAnimation] forKey:@"scale-layer"];
        }
            break;
        default:
            break;
    }
}

-(void)hideContentView{
    switch (self.hideAnimationStyle) {
        case HideAnimationStyle_Detafult:{
            [self.contentView.layer addAnimation:[self defaultHideAnimation] forKey:@"scale-layer-hide"];
            [self removeFromSuperview];
        }
            break;
        default:
            break;
    }
}

-(CAAnimation *)defaultShowAnimation{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.duration = 0.25; // 动画持续时间
    animation.repeatCount = 1; // 重复次数
    animation.fromValue = [NSNumber numberWithFloat:0.001];
    animation.toValue = [NSNumber numberWithFloat:1.0];
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [animation setValue:@"show" forKey:@"AnimationKey"];
    return animation;
}

-(CAAnimation *)defaultHideAnimation{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.duration = 0.25; // 动画持续时间
    animation.repeatCount = 1; // 重复次数
    animation.fromValue = [NSNumber numberWithFloat:1.0];
    animation.toValue = [NSNumber numberWithFloat:0.01];
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.delegate = self;
    [animation setValue:@"hide" forKey:@"AnimationKey"];
    return animation;
}

#pragma mark - 点击ContentView以外的区域才起作用
-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    CGPoint btnP = [self convertPoint:point toView:self.contentView];
    if ([self.contentView pointInside:btnP withEvent:event]) {
        return nil;
    }else{
        return [super hitTest:point withEvent:event];
    }
}


@end
