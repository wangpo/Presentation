//
//  SGPopoverBackgroundView.h
//  SGCC
//
//  Created by wangpo on 2018/6/14.
//  Copyright © 2018年 SGCC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SGPopoverBackgroundView : UIPopoverBackgroundView
{
    CGFloat                     _arrowOffset;
    UIPopoverArrowDirection     _arrowDirection;
    UIImageView                *_arrowImageView;
    UIImageView                *_popoverBackgroundImageView;
    
}

@property (nonatomic, assign) CGFloat arrowOffset;
@property (nonatomic, assign) UIPopoverArrowDirection arrowDirection;
@property (nonatomic, strong) UIImageView *arrowImageView;
@property (nonatomic, strong) UIImageView *popoverBackgroundImageView;

+ (CGFloat)arrowBase;
+ (UIEdgeInsets)contentViewInsets;
+ (CGFloat)arrowHeight;

@end
