//
//  NSString+ZJLDisplayTextView.m
//  ZJLDisplayTextViewExample
//
//  Created by ZhongZhongzhong on 16/6/19.
//  Copyright © 2016年 ZhongZhongzhong. All rights reserved.
//

#import "NSString+ZJLDisplayTextView.h"

@implementation NSString (ZJLDisplayTextView)
- (CGSize)sizeWithFont:(UIFont *)font boundingSize:(CGSize)boundingSize
{
    CGSize size;
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_7_0
    NSStringDrawingOptions option = NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin;
    NSDictionary *attributes = @{NSFontAttributeName: font};
    CGRect frame = [self boundingRectWithSize:boundingSize options:option attributes:attributes context:nil];
    size = frame.size;
#else
    size = [self sizeWithFont:font constrainedToSize:boundingSize lineBreakMode:NSLineBreakByCharWrapping];
#endif
    return size;
}
@end
