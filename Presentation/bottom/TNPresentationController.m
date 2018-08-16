//
//  TNPresentationController.m
//  WPDevelopProject
//
//  Created by wangpo on 2018/3/29.
//  Copyright © 2018年 BaoFeng. All rights reserved.
//  

#import "TNPresentationController.h"

@interface TNPresentationController ()

@property (nonatomic, strong) UIVisualEffectView *visualEffectView;

@end

@implementation TNPresentationController

- (UIVisualEffectView *)visualEffectView
{
    if (!_visualEffectView) {
        UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
        _visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blur];
        _visualEffectView.frame = self.containerView.bounds;
        _visualEffectView.alpha = 0.4;
        _visualEffectView.backgroundColor = [UIColor blackColor];
    }
    return _visualEffectView;
}

- (instancetype)initWithPresentedViewController:(UIViewController *)presentedViewController presentingViewController:(UIViewController *)presentingViewController
{
    return [super initWithPresentedViewController:presentedViewController presentingViewController:presentingViewController];
}

- (void)presentationTransitionWillBegin
{
    self.visualEffectView.alpha = 0.0;
    [self.containerView addSubview:self.visualEffectView];
    [UIView animateWithDuration:0.5 animations:^{
         self.visualEffectView.alpha = 0.4;
    }];
}

- (void)presentationTransitionDidEnd:(BOOL)completed
{
    if (!completed) {
        [self.visualEffectView removeFromSuperview];
    }
}

- (void)dismissalTransitionWillBegin
{
    [UIView animateWithDuration:0.5 animations:^{
        self.visualEffectView.alpha = 0.0;
    }];
}

- (void)dismissalTransitionDidEnd:(BOOL)completed
{
    if (completed) {
        [self.visualEffectView removeFromSuperview];
    }
}

- (CGRect)frameOfPresentedViewInContainerView
{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    self.presentedView.frame = CGRectMake(0, height - 300, width, 300);
    return self.presentedView.frame;
}

@end
