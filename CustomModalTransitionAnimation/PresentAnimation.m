//
//  PresentAnimation.m
//  CustomModalTransitionAnimation
//
//  Created by Baoqin Huang on 2017/6/25.
//  Copyright © 2017年 Baoqin Huang. All rights reserved.
//

#import "PresentAnimation.h"

@implementation PresentAnimation

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.6;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    
    [containerView addSubview:toVC.view];
    
    CGRect targetFrame = [transitionContext finalFrameForViewController:toVC];
    toVC.view.frame = CGRectOffset(targetFrame, CGRectGetWidth(targetFrame), -CGRectGetHeight(targetFrame));
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        toVC.view.frame = targetFrame;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}

@end
