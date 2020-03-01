//
//  QQMessageFrame.m
//  01_QQ
//
//  Created by xubinbin on 2020/2/28.
//  Copyright © 2020 ccsu_cat. All rights reserved.
//

#import "QQMessageFrame.h"
#import "QQmessage.h"
@implementation QQMessageFrame
- (void)setMessage:(QQmessage *)message
{
    _message = message;
    CGFloat padding = 10;
    //屏幕g宽度
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    
    CGFloat timeX = 0;
    CGFloat timeY = 0;
    CGFloat timeH = 30;
    CGFloat timeW = screenWidth;
    if (message.hiddenTime == NO) {
        _timeF = CGRectMake(timeX, timeY, timeW, timeH);
    }
    CGFloat iconH = 50;
    CGFloat iconW = 50;
    CGFloat iconY = CGRectGetMaxY(_timeF) + padding;
    CGFloat iconX = padding;
    if (message.type == MessageModelToMe) {
        iconX = screenWidth - padding - iconW;
    }
    _iconF = CGRectMake(iconX, iconY, iconW, iconH);
    
    NSDictionary *dict = @{NSFontAttributeName: TextFont};
    CGSize maxSize = CGSizeMake(200, MAXFLOAT);
    CGSize textSize = [message.text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    CGFloat textW = textSize.width + QQMessageEdgeInsetsWidth * 2;
    CGFloat textH = textSize.height + QQMessageEdgeInsetsWidth * 2;
    CGFloat textY = iconY;
    CGFloat textX = CGRectGetMaxX(_iconF) + padding;
    if (message.type == MessageModelToMe) {
        textX = iconX - padding - textW;
    }
    _textF = CGRectMake(textX, textY, textW, textH);
    
    self.cellHeight = MAX(textY + textH, iconY + iconH) + padding;
}
@end
