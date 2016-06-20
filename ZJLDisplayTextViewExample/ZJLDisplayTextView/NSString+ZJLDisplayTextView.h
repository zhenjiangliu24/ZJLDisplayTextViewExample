//
//  NSString+ZJLDisplayTextView.h
//  ZJLDisplayTextViewExample
//
//  Created by ZhongZhongzhong on 16/6/19.
//  Copyright © 2016年 ZhongZhongzhong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (ZJLDisplayTextView)
- (CGSize)sizeWithFont:(UIFont *)font boundingSize:(CGSize)boundingSize;
@end
