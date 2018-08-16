//
//  SGPopoverBackgroundView.m
//  SGCC
//
//  Created by wangpo on 2018/6/14.
//  Copyright © 2018年 SGCC. All rights reserved.
//

#import "SGPopoverBackgroundView.h"

#define ARROW_WIDTH 9.0
#define ARROW_HEIGHT 7.0

@interface SGPopoverBackgroundView ()
{
    UIImage *_topArrowImage;
    UIImage *_leftArrowImage;
    UIImage *_rightArrowImage;
    UIImage *_bottomArrowImage;
}
@end

@implementation SGPopoverBackgroundView

@synthesize arrowOffset = _arrowOffset;
@synthesize arrowDirection = _arrowDirection;
@synthesize arrowImageView = _arrowImageView;
@synthesize popoverBackgroundImageView = _popoverBackgroundImageView;

#pragma mark - Overriden class methods
+ (CGFloat)arrowBase
{
    return ARROW_WIDTH;
}

+ (CGFloat)arrowHeight
{
    return ARROW_HEIGHT;
}

+ (UIEdgeInsets)contentViewInsets
{
    return UIEdgeInsetsMake(-7, 0, 0, 0);
}

#pragma mark - Custom setters for updating layout
- (void)setArrowOffset:(CGFloat)arrowOffset
{
    _arrowOffset = arrowOffset;
    [self setNeedsLayout];
}

- (void)setArrowDirection:(UIPopoverArrowDirection)arrowDirection
{
    _arrowDirection = arrowDirection;
    [self setNeedsLayout];
}

#pragma mark - Initialization

-(id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]){
    
        _topArrowImage = nil;
        _topArrowImage = nil;
        _leftArrowImage = nil;
        _bottomArrowImage = nil;
        _rightArrowImage = nil;
    
        //自定义背景
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = 3;
        self.layer.masksToBounds = YES;
        //背景视图
//        self.popoverBackgroundImageView = [[UIImageView alloc] initWithImage:nil];
//        [self addSubview:self.popoverBackgroundImageView];
        
        //箭头视图
        self.arrowImageView = [[UIImageView alloc] init];
        [self addSubview:self.arrowImageView];
    }
    
    return self;
}

#pragma mark - Layout subviews

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat popoverImageOriginX = 0;
    CGFloat popoverImageOriginY = 0;
    
    CGFloat popoverImageWidth = self.bounds.size.width;
    CGFloat popoverImageHeight = self.bounds.size.height;
    
    CGFloat arrowImageOriginX = 0;
    CGFloat arrowImageOriginY = 0;
    
    CGFloat arrowImageWidth = ARROW_WIDTH;
    CGFloat arrowImageHeight = ARROW_HEIGHT;
    
    // Radius value you used to make rounded corners in your popover background image
    CGFloat cornerRadius = 9;
    
    switch (self.arrowDirection) {
            
        case UIPopoverArrowDirectionUp:
            
            popoverImageOriginY = ARROW_HEIGHT - 2;
            popoverImageHeight = self.bounds.size.height - ARROW_HEIGHT;
            
            // Calculating arrow x position using arrow offset, arrow width and popover width
            arrowImageOriginX = roundf((self.bounds.size.width - ARROW_WIDTH) / 2 + self.arrowOffset);
            
            // If arrow image exceeds rounded corner arrow image x postion is adjusted
            arrowImageOriginX = MIN(arrowImageOriginX, self.bounds.size.width - ARROW_WIDTH - cornerRadius);
            arrowImageOriginX = MAX(arrowImageOriginX, cornerRadius);
            
            // Setting arrow image for current arrow direction
            self.arrowImageView.image = _topArrowImage;
            
            break;
            
        case UIPopoverArrowDirectionDown:
            
            popoverImageHeight = self.bounds.size.height - ARROW_HEIGHT + 2;
            
            arrowImageOriginX = roundf((self.bounds.size.width - ARROW_WIDTH) / 2 + self.arrowOffset);
            
            arrowImageOriginX = MIN(arrowImageOriginX, self.bounds.size.width - ARROW_WIDTH - cornerRadius);
            arrowImageOriginX = MAX(arrowImageOriginX, cornerRadius);
            
            arrowImageOriginY = popoverImageHeight - 2;
            
            self.arrowImageView.image = _bottomArrowImage;
            
            break;
            
        case UIPopoverArrowDirectionLeft:
            
            popoverImageOriginX = ARROW_HEIGHT - 2;
            popoverImageWidth = self.bounds.size.width - ARROW_HEIGHT;
            
            arrowImageOriginY = roundf((self.bounds.size.height - ARROW_WIDTH) / 2 + self.arrowOffset);
            
            arrowImageOriginY = MIN(arrowImageOriginY, self.bounds.size.height - ARROW_WIDTH - cornerRadius);
            arrowImageOriginY = MAX(arrowImageOriginY, cornerRadius);
            
            arrowImageWidth = ARROW_HEIGHT;
            arrowImageHeight = ARROW_WIDTH;
            
            self.arrowImageView.image = _leftArrowImage;
            
            break;
            
        case UIPopoverArrowDirectionRight:
            
            popoverImageWidth = self.bounds.size.width - ARROW_HEIGHT + 2;
            
            arrowImageOriginX = popoverImageWidth - 2;
            arrowImageOriginY = roundf((self.bounds.size.height - ARROW_WIDTH) / 2 + self.arrowOffset);
            
            arrowImageOriginY = MIN(arrowImageOriginY, self.bounds.size.height - ARROW_WIDTH - cornerRadius);
            arrowImageOriginY = MAX(arrowImageOriginY, cornerRadius);
            
            arrowImageWidth = ARROW_HEIGHT;
            arrowImageHeight = ARROW_WIDTH;
            
            self.arrowImageView.image = _rightArrowImage;
            
            break;
            
        default:
            
            // For popovers without arrows (Thanks Martin!)
            popoverImageHeight = self.bounds.size.height - ARROW_HEIGHT + 2;
            
            break;
    }
    
    //self.popoverBackgroundImageView.frame = CGRectMake(popoverImageOriginX, popoverImageOriginY, popoverImageWidth, popoverImageHeight);
    self.arrowImageView.frame = CGRectMake(arrowImageOriginX, arrowImageOriginY, arrowImageWidth, arrowImageHeight);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
