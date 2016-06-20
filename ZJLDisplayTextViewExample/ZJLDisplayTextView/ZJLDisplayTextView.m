//
//  ZJLDisplayTextView.m
//  ZJLDisplayTextViewExample
//
//  Created by ZhongZhongzhong on 16/6/20.
//  Copyright © 2016年 ZhongZhongzhong. All rights reserved.
//

#import "ZJLDisplayTextView.h"
#import "NSString+ZJLDisplayTextView.h"

static const CGFloat GradientWidth = 20;
static const CGFloat Velocity = 50;
static const CGFloat Spacing = 20;
static const NSTimeInterval Interval = 3;
static const CGFloat FontSize = 20;


@interface ZJLDisplayTextView()
@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) UILabel *firstLabel;
@property (nonatomic, strong) UILabel *secondLabel;
@property (nonatomic, strong) CAGradientLayer *gradientLayer;
@property (nonatomic, strong) CABasicAnimation *xDirectionAnimation;
@property (nonatomic, strong) UIFont *font;
@property (nonatomic, assign) CGPoint originalPoint;
@end

@implementation ZJLDisplayTextView
- (instancetype)initWithPosition:(CGPoint)position text:(NSString *)text fontSize:(CGFloat)fontSize
{
    self = [super init];
    if (self) {
        _text = text;
        _fontSize = fontSize;
        _originalPoint = position;
        [self setup];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    _xDirectionAnimation = [CABasicAnimation animationWithKeyPath:@"position.x"];
    _xDirectionAnimation.beginTime = _interval;
    _xDirectionAnimation.fromValue = @(self.bounds.size.width+_spacing);
    NSTimeInterval move = (self.bounds.size.width+_spacing)/_velocity;
    _xDirectionAnimation.duration = move;
    _xDirectionAnimation.toValue = @(0);
    _xDirectionAnimation.repeatCount = HUGE;
    _xDirectionAnimation.fillMode = kCAFillModeForwards;
    [_containerView.layer addAnimation:_xDirectionAnimation forKey:@"move"];
}


- (void)setup
{
    [self setVars];
    [self setViews];
}

- (void)setVars
{
    _gradientWidth = GradientWidth;
    _velocity = Velocity;
    _spacing = Spacing;
    _interval = Interval;
    _font = [UIFont systemFontOfSize:_fontSize?_fontSize:FontSize];
    _textColor = [UIColor blackColor];
    _backgroundColor = _backgroundColor?_backgroundColor:[UIColor whiteColor];
    _font = [UIFont systemFontOfSize:_fontSize?_fontSize:FontSize];
}

- (void)setViews
{
    
    
    self.clipsToBounds = YES;
    self.backgroundColor = _backgroundColor;
    CGSize size = [_text sizeWithFont:_font boundingSize:CGSizeMake(CGFLOAT_MAX, 0)];
    self.frame = CGRectMake(_originalPoint.x, _originalPoint.y, size.width, size.height);
    
    _containerView = [UIView new];
    _containerView.backgroundColor = _backgroundColor?_backgroundColor:[UIColor whiteColor];
    
    _firstLabel = [UILabel new];
    _firstLabel.text = _text;
    _firstLabel.textColor = _textColor;
    _firstLabel.textAlignment = NSTextAlignmentCenter;
    _firstLabel.font = _font;
    
    _secondLabel = [UILabel new];
    _secondLabel.text = _text;
    _secondLabel.textColor = _textColor;
    _secondLabel.font = _font;
    _secondLabel.textAlignment = NSTextAlignmentLeft;
    
    self.containerView.frame = CGRectMake(0, 0, size.width*2+_spacing*2, size.height);
    _firstLabel.frame = CGRectMake(_spacing, 0, size.width, size.height);
    _secondLabel.frame = CGRectOffset(_firstLabel.frame, size.width+_spacing, 0);
    [self addSubview:_containerView];
    [_containerView addSubview:_firstLabel];
    [_containerView addSubview:_secondLabel];
    
    self.gradientLayer.frame = self.bounds;
    self.layer.mask = self.gradientLayer;
}


- (CAGradientLayer *)gradientLayer
{
    if (!_gradientLayer) {
        _gradientLayer = [CAGradientLayer layer];
        _gradientLayer.colors = @[(__bridge id)[UIColor clearColor].CGColor,
                                  (__bridge id)[UIColor whiteColor].CGColor,
                                  (__bridge id)[UIColor whiteColor].CGColor,
                                  (__bridge id)[UIColor clearColor].CGColor];
        _gradientLayer.locations = @[@(0),
                                     @(self.gradientWidth/self.bounds.size.width),
                                     @(1 - self.gradientWidth/self.bounds.size.width),
                                     @(1)];
        _gradientLayer.startPoint = CGPointMake(0, 0);
        _gradientLayer.endPoint = CGPointMake(1, 0);
    }
    return _gradientLayer;
}
@end
