//
//  ZJLDisplayTextView.h
//  ZJLDisplayTextViewExample
//
//  Created by ZhongZhongzhong on 16/6/20.
//  Copyright © 2016年 ZhongZhongzhong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZJLDisplayTextView : UIView
@property (nonatomic, assign) CGFloat gradientWidth;
@property (nonatomic, assign) CGFloat velocity;
@property (nonatomic, assign) CGFloat spacing;
@property (nonatomic, assign) NSTimeInterval interval;
@property (nonatomic, assign) CGFloat fontSize;
@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, strong) UIColor *backgroundColor;
@property (nonatomic, strong) NSString *text;

- (instancetype)initWithPosition:(CGPoint)position text:(NSString *)text fontSize:(CGFloat)fontSize;
@end
