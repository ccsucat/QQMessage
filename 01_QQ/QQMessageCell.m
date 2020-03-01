//
//  QQMessageCell.m
//  01_QQ
//
//  Created by xubinbin on 2020/2/28.
//  Copyright © 2020 ccsu_cat. All rights reserved.
//

#import "QQMessageCell.h"
#import "QQMessageFrame.h"
#import "QQmessage.h"

@interface QQMessageCell()
@property (nonatomic, weak) UILabel *timeLabel;
@property (nonatomic, weak) UIButton *contentBtn;
@property (nonatomic, weak) UIImageView *iconView;
@end
@implementation QQMessageCell
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *identifier = @"message";
    QQMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[QQMessageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UILabel *timeLabel = [[UILabel alloc] init];
        timeLabel.font = [UIFont systemFontOfSize:13];
        timeLabel.textAlignment = NSTextAlignmentCenter;
        timeLabel.textColor = [UIColor grayColor];
        [self.contentView addSubview:timeLabel];
        self.timeLabel = timeLabel;
        
        UIButton *contentBtn = [[UIButton alloc] init];
        contentBtn.titleLabel.font = TextFont;
        contentBtn.contentEdgeInsets = UIEdgeInsetsMake(QQMessageEdgeInsetsWidth, QQMessageEdgeInsetsWidth, QQMessageEdgeInsetsWidth, QQMessageEdgeInsetsWidth);
        [contentBtn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
        contentBtn.titleLabel.numberOfLines = 0;
        [self.contentView addSubview:contentBtn];
        self.contentBtn = contentBtn;
        
        UIImageView *iconView = [[UIImageView alloc] init];
        [self.contentView addSubview:iconView];
        self.iconView = iconView;
        
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)setMFrame:(QQMessageFrame *)mFrame
{
    _mFrame = mFrame;
    QQmessage *message = mFrame.message;
    self.timeLabel.text = message.time;
    self.timeLabel.frame = mFrame.timeF;
//    
    if (message.type == MessageModelToMe) {
        self.iconView.image = [UIImage imageNamed:@"me"];
    } else {
        self.iconView.image = [UIImage imageNamed:@"other"];
    }
    self.iconView.frame = mFrame.iconF;
    
    
    
    [self.contentBtn setTitle:message.text forState:UIControlStateNormal];
    self.contentBtn.frame = mFrame.textF;
    NSString *imageName = @"chat_send_nor";
    if (message.type != MessageModelToMe) {
        imageName = @"chat_recive_press_pic";
    }
    UIImage *image = [UIImage imageNamed:imageName];
    //UIImage *newImage = [image stretchableImageWithLeftCapWidth:32 topCapHeight:25];
    
    CGFloat w = image.size.width * 0.5;
    CGFloat h = image.size.height * 0.5;
    
    UIImage *newImage = [image resizableImageWithCapInsets:UIEdgeInsetsMake(h, w, h, w) resizingMode:UIImageResizingModeStretch];
    
    [self.contentBtn setBackgroundImage:newImage forState:UIControlStateNormal];
    
}
@end
